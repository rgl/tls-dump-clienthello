Set-StrictMode -Version Latest
$ProgressPreference = 'SilentlyContinue'
$ErrorActionPreference = 'Stop'
trap {
    Write-Host "ERROR: $_"
    ($_.ScriptStackTrace -split '\r?\n') -replace '^(.*)$','ERROR: $1' | Write-Host
    ($_.Exception.ToString() -split '\r?\n') -replace '^(.*)$','ERROR EXCEPTION: $1' | Write-Host
    Exit 1
}

# import the bash function.
. c:/vagrant/provisioning/windows/bash.ps1

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

# stop the service to ensure the logs are flushed.
Stop-Service tls-dump-clienthello

# write the summary.
. c:/vagrant/provisioning/windows/get-example-summary.ps1

# start the service.
Start-Service tls-dump-clienthello
