$serviceName = 'tls-dump-clienthello'
$serviceUsername = "NT SERVICE\$serviceName"
$serviceHome = "C:\$serviceName"
$serviceSourcePath = Resolve-Path 'c:\vagrant\dist\*\*.exe'
$servicePath = "$serviceHome\$(Split-Path -Leaf $serviceSourcePath)"

# uninstall when required.
if (Get-Service -ErrorAction Silentlycontinue $serviceName) {
    Stop-Service $serviceName
    nssm remove $serviceName confirm
}
if (Test-Path $serviceHome) {
    Remove-Item -Recurse -Force $serviceHome
}

# install the service.
Write-Host "Creating the $serviceName service..."
nssm install $serviceName $servicePath
nssm set $serviceName AppDirectory $serviceHome
nssm set $serviceName Start SERVICE_DEMAND_START
nssm set $serviceName AppRotateFiles 1
nssm set $serviceName AppRotateOnline 1
nssm set $serviceName AppRotateSeconds 86400
nssm set $serviceName AppRotateBytes 1048576
nssm set $serviceName AppStdout $serviceHome\$serviceName-stdout.log
nssm set $serviceName AppStderr $serviceHome\$serviceName-stderr.log
$result = sc.exe sidtype $serviceName unrestricted
if ($result -ne '[SC] ChangeServiceConfig2 SUCCESS') {
    throw "sc.exe sidtype failed with $result"
}
$result = sc.exe config $serviceName obj= $serviceUsername
if ($result -ne '[SC] ChangeServiceConfig SUCCESS') {
    throw "sc.exe config failed with $result"
}

# install the binaries.
mkdir $serviceHome -Force | Out-Null
Disable-CAclInheritance $serviceHome
Grant-CPermission $serviceHome $serviceUsername FullControl
Grant-CPermission $serviceHome $env:USERNAME FullControl
Grant-CPermission $serviceHome Administrators FullControl
Copy-Item $serviceSourcePath $serviceHome
Copy-Item ..\..\*.pem $serviceHome
Copy-Item ..\..\*.csv $serviceHome

# start the service.
Start-Service $serviceName
