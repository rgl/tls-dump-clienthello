function Write-Summary($lines) {
    if (!$lines) {
        return
    }
    $qs = $lines | ForEach-Object {
        if ($_ -match '^http query: (?<name>.+?)=(?<value>.+)') {
            [PSCustomObject]@{
                Name = $Matches.name
                Value = $Matches.value
            }
        }
    }
    $client = ($qs | Where-Object { $_.Name -eq 'example-client' }).Value
    $parts = $client -split '/'
    $name = $parts[0]
    $version = $parts[1]
    $title = switch ($name) {
        'chrome'            { "Chrome $version" }
        'curl'              { "Curl $version" }
        'dotnet'            { ".NET $version" }
        'dotnetframework'   { ".NET Framework $version" }
        'firefox'           { "Firefox $version" }
        'go'                { "Go $version" }
        'java'              { "Java $version" }
        'nodejs'            { "Node.js $version" }
    }
    [PSCustomObject]@{
        Client = $client
        Title = $title
        Name = $name
        Version = $version
        Lines = $lines
    }
}

function Get-WindowsVersion {
    # see https://en.wikipedia.org/wiki/Windows_10_version_history
    # see https://en.wikipedia.org/wiki/Windows_11_version_history
    # see https://en.wikipedia.org/wiki/Microsoft_Windows_version_history
    $builds = @{
        17763 = @{Name='Windows Server 2019';   Version='1809'; ReleaseDate='November 13, 2018'}
        19042 = @{Name='Windows 10';            Version='20H2'; ReleaseDate='October 20, 2020'}
        20348 = @{Name='Windows Server 2022';   Version='21H2'; ReleaseDate='August 18, 2021'}
        22000 = @{Name='Windows 11';            Version='21H2'; ReleaseDate='October 4, 2021'}
    }
    $currentVersionKey = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
    $build = [int]$currentVersionKey.CurrentBuildNumber
    [PSCustomObject]$builds[$build]
}

function Get-Summary($windowsVersion) {
    @"
# Example $($windowsVersion.Name) ($($windowsVersion.Version)) outputs
"@

    Get-Content c:\tls-dump-clienthello\*-stderr.log | ForEach-Object -Begin {
        $lines = @()
    } -Process {
        if ($_ -eq '----') {
            Write-Summary $lines
            $lines = @()
        } elseif ($_ -match '^(client|handshake|http).*?: .+' -and $_ -notmatch '^client address:') {
            $lines += $_
        }
    } -End {
        Write-Summary $lines
    } | Sort-Object Title | ForEach-Object {
        @"

## $($_.Title)
"@
        if ($_.Name -match '(chrome|firefox)') {
            @"

With [example-clients/browser/main.js](example-clients/browser/main.js).
"@
        } elseif ($_.Name -eq 'curl') {
            @"

With [example-clients/curl](example-clients/curl/run.sh).
"@
        } elseif ($_.Name -match 'dotnet(framework)?') {
            @"

With [example-clients/$($Matches[1])/Program.cs](example-clients/$($Matches[1])/Program.cs):

``````csharp
new WebClient().DownloadString("https://example.com:8888");
``````
"@
        } elseif ($_.Name -eq 'go') {
            @"
    
With [example-clients/go/main.go](example-clients/go/main.go):

``````go
http.Get("https://example.com:8888")
``````
"@
        } elseif ($_.Name -eq 'java') {
            @"
    
With [example-clients/java](example-clients/java/src/main/java/net/example/Example.java):

``````java
new URL("https://example.com:8888")
    .openConnection()
    .getInputStream()
    .close();
``````
"@
        } elseif ($_.Name -eq 'nodejs') {
            @"
    
With [example-clients/nodejs](example-clients/nodejs/main.js):
"@
    }
    @"

Outputs:

``````
$($_.Lines -join "`n")
``````
"@
    }
}

$windowsVersion = Get-WindowsVersion

$summary = Get-Summary $windowsVersion

[System.IO.File]::WriteAllLines(
    "c:\vagrant\example-clients-output-$($windowsVersion.Name.ToLowerInvariant() -replace ' ','-')-$($windowsVersion.Version.ToLowerInvariant()).md",
    $summary,
    (New-Object System.Text.UTF8Encoding $False))

Write-Output $summary
