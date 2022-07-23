# install 7-Zip.
choco install -y 7zip

# install nssm.
choco install -y nssm

# install carbon.
choco install -y carbon

# install IIS Crypto.
choco install -y iiscrypto

# install git and related applications.
choco install -y git --params '/GitOnlyOnPath /NoAutoCrlf /SChannel'
choco install -y gitextensions
choco install -y meld

# update $env:PATH with the recently installed Chocolatey packages.
Import-Module C:\ProgramData\chocolatey\helpers\chocolateyInstaller.psm1
Update-SessionEnvironment

# configure git.
# see http://stackoverflow.com/a/12492094/477532
git config --global --add safe.directory "%(prefix)///$((Get-Item c:\vagrant).Target -replace 'UNC\\','' -replace '\\','/')/"
git config --global user.name 'Rui Lopes'
git config --global user.email 'rgl@ruilopes.com'
git config --global push.default simple
git config --global core.autocrlf false
git config --global diff.guitool meld
git config --global difftool.meld.path 'C:/Program Files (x86)/Meld/Meld.exe'
git config --global difftool.meld.cmd '\"C:/Program Files (x86)/Meld/Meld.exe\" \"$LOCAL\" \"$REMOTE\"'
git config --global merge.tool meld
git config --global mergetool.meld.path 'C:/Program Files (x86)/Meld/Meld.exe'
git config --global mergetool.meld.cmd '\"C:/Program Files (x86)/Meld/Meld.exe\" --diff \"$LOCAL\" \"$BASE\" \"$REMOTE\" --output \"$MERGED\"'
#git config --list --show-origin

# install msys2.
choco install -y msys2

# configure the msys2 launcher to let the shell inherith the PATH.
$msys2BasePath = 'C:\tools\msys64'
$msys2ConfigPath = "$msys2BasePath\msys2.ini"
[IO.File]::WriteAllText(
    $msys2ConfigPath,
    ([IO.File]::ReadAllText($msys2ConfigPath) `
        -replace '#?(MSYS2_PATH_TYPE=).+','$1inherit')
)

# configure msys2.
[IO.File]::WriteAllText(
    "$msys2BasePath\etc\nsswitch.conf",
    ([IO.File]::ReadAllText("$msys2BasePath\etc\nsswitch.conf") `
        -replace '(db_home: ).+','$1windows')
)
Write-Output 'C:\Users /home' | Out-File -Encoding ASCII -Append "$msys2BasePath\etc\fstab"

# define a function for easying the execution of bash scripts.
$bashPath = "$msys2BasePath\usr\bin\bash.exe"
function Bash($script) {
    $eap = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        # we also redirect the stderr to stdout because PowerShell
        # oddly interleaves them.
        # see https://www.gnu.org/software/bash/manual/bash.html#The-Set-Builtin
        Write-Output 'exec 2>&1;set -eu;export PATH="/usr/bin:$PATH"' $script | &$bashPath
        if ($LASTEXITCODE) {
            throw "bash execution failed with exit code $LASTEXITCODE"
        }
    } finally {
        $ErrorActionPreference = $eap
    }
}

# configure the shell.
Bash @'
pacman --noconfirm -Sy --needed make

cat >~/.bash_history <<"EOF"
EOF

cat >~/.bashrc <<"EOF"
export EDITOR=vim
export PAGER=less
alias l='ls -lF --color'
alias ll='l -a'
alias h='history 25'
alias j='jobs -l'
EOF

cat >~/.inputrc <<"EOF"
"\e[A": history-search-backward
"\e[B": history-search-forward
"\eOD": backward-word
"\eOC": forward-word
set show-all-if-ambiguous on
set completion-ignore-case on
EOF
'@

# install the .net framework development tools.
# see https://community.chocolatey.org/packages/netfx-4.8-devpack
choco install -y netfx-4.8-devpack

# install the .net development tools.
# see https://community.chocolatey.org/packages/dotnet-sdk
choco install -y dotnet-sdk --version 6.0.300 # dotnet 6.0.5

# install the go development tools.
# see https://community.chocolatey.org/packages/go
choco install -y go --version 1.18.4

# install the java development tools.
# see https://community.chocolatey.org/packages/temurin11
# see https://community.chocolatey.org/packages/gradle
choco install -y temurin11 --version 11.0.15.1000 # jdk 11.0.15
choco install -y gradle --version 7.4.2

# install the node.js development tools.
# see https://community.chocolatey.org/packages/nodejs-lts
choco install -y nodejs-lts --version 16.16.0

# install the rust development tools.
# see https://community.chocolatey.org/packages/rust-ms
choco install -y visualstudio2019-workload-vctools
choco install -y rust-ms --version 1.62.0

# install the erlang development tools.
# see https://community.chocolatey.org/packages/erlang
# see https://community.chocolatey.org/packages/rebar3
# see https://github.com/ElixirWin/ChocolateyPackages/pull/62
# see https://github.com/rgl/ErlangChocolateyPackages/tree/rgl
$url = 'https://github.com/rgl/ErlangChocolateyPackages/archive/refs/heads/rgl.zip'
$path = "$env:TEMP\ErlangChocolateyPackages"
$zipPath = "$path.zip"
(New-Object Net.WebClient).DownloadFile($url, $zipPath)
Expand-Archive -Path $zipPath -DestinationPath $path
Push-Location "$path\ErlangChocolateyPackages-rgl\Erlang"
choco pack
choco install -y erlang --source $PWD --version 25.0
Set-Location ..\Rebar
choco pack
choco install -y rebar3 --source $PWD --version 3.18.0
Pop-Location
