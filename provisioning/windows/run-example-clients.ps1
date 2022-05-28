Set-StrictMode -Version Latest
$ProgressPreference = 'SilentlyContinue'
$ErrorActionPreference = 'Stop'
trap {
    Write-Host "ERROR: $_"
    ($_.ScriptStackTrace -split '\r?\n') -replace '^(.*)$','ERROR: $1' | Write-Host
    ($_.Exception.ToString() -split '\r?\n') -replace '^(.*)$','ERROR EXCEPTION: $1' | Write-Host
    Exit 1
}

# define a function for easying the execution of bash scripts.
$msys2BasePath = 'C:\tools\msys64'
$bashPath = "$msys2BasePath\usr\bin\bash.exe"
function Bash($script) {
    $eap = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        # we also redirect the stderr to stdout because PowerShell
        # oddly interleaves them.
        # see https://www.gnu.org/software/bash/manual/bash.html#The-Set-Builtin
        echo 'exec 2>&1;set -eu;export PATH="/usr/bin:$PATH";export HOME=$USERPROFILE;' $script | &$bashPath
        if ($LASTEXITCODE) {
            throw "bash execution failed with exit code $LASTEXITCODE"
        }
    } finally {
        $ErrorActionPreference = $eap
    }
}

# delete all the service logs.
# NB this is required to produce a valid summary.
Stop-Service tls-dump-clienthello
Remove-Item c:/tls-dump-clienthello\*.log
Start-Service tls-dump-clienthello

# execute the examples.
Set-Location c:/tmp/example-clients
Get-ChildItem */run.sh | Sort-Object FullName | ForEach-Object {
    Set-Location $_.Directory
    Write-Host "Executing $_..."
    Bash ./run.sh
}

# write the summary.
. c:/vagrant/provisioning/windows/get-example-summary.ps1
