# set keyboard layout.
# NB you can get the name from the list:
#      [System.Globalization.CultureInfo]::GetCultures('InstalledWin32Cultures') | out-gridview
Set-WinUserLanguageList pt-PT -Force

# set the date format, number format, etc.
Set-Culture pt-PT

# set the UI language.
Set-WinUILanguageOverride en-US

# set the timezone.
# tzutil /l lists all available timezone ids
& $env:windir\system32\tzutil /s "GMT Standard Time"

# show window content while dragging.
Set-ItemProperty -Path 'HKCU:Control Panel\Desktop' -Name DragFullWindows -Value 1

# show hidden files.
Set-ItemProperty -Path HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -Value 1

# show file extensions.
Set-ItemProperty -Path HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Value 0

# display full path in the title bar.
New-Item -Path HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState -Force `
    | New-ItemProperty -Name FullPath -Value 1 -PropertyType DWORD `
    | Out-Null

# set default Explorer location to This PC.
Set-ItemProperty -Path HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1

# install Google Chrome.
# see https://www.chromium.org/administrators/configuring-other-preferences
choco install -y googlechrome
$chromeLocation = 'C:\Program Files\Google\Chrome\Application'
cp -Force GoogleChrome-external_extensions.json (Resolve-Path "$chromeLocation\*\default_apps\external_extensions.json")
cp -Force GoogleChrome-master_preferences.json "$chromeLocation\master_preferences"
cp -Force GoogleChrome-master_bookmarks.html "$chromeLocation\master_bookmarks.html"

# install Firefox.
choco install -y firefox

# set the default browser.
choco install -y SetDefaultBrowser
SetDefaultBrowser HKLM 'Google Chrome'

# replace notepad with notepad3.
choco install -y notepad3

# set the example.com domain ip address to point to the local machine.
Add-Content `
    -Encoding ASCII `
    -Path c:/Windows/System32/drivers/etc/hosts `
    -Value '127.0.0.1 example.com'

# trust the example.com certificate.
Import-Certificate `
    -FilePath C:/vagrant/example.com-crt.pem `
    -CertStoreLocation Cert:/LocalMachine/Root `
    | Out-Null
