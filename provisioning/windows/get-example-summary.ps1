function Get-WindowsVersion {
    # see https://en.wikipedia.org/wiki/Windows_10_version_history
    # see https://en.wikipedia.org/wiki/Windows_11_version_history
    # see https://en.wikipedia.org/wiki/Microsoft_Windows_version_history
    $builds = @{
        17763 = @{Name='Windows Server 2019';   Version='1809'; ReleaseDate='November 13, 2018'}
        19042 = @{Name='Windows 10';            Version='20H2'; ReleaseDate='October 20, 2020'}
        20348 = @{Name='Windows Server 2022';   Version='21H2'; ReleaseDate='August 18, 2021'}
        22000 = @{Name='Windows 11';            Version='21H2'; ReleaseDate='October 4, 2021'}
        22621 = @{Name='Windows 11';            Version='22H2'; ReleaseDate='September 20, 2022'}
    }
    $currentVersionKey = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
    $build = [int]$currentVersionKey.CurrentBuildNumber
    [PSCustomObject]$builds[$build]
}

function Write-Summary($lines) {
    if (!$lines) {
        return
    }
    $exampleClient = $lines | ForEach-Object {
        if ($_ -match '^http query: (?<name>.+?)=(?<value>.+)') {
            [PSCustomObject]@{
                Name = $Matches.name
                Value = $Matches.value
            }
        }
    } | Where-Object { $_.Name -eq 'example-client' }
    if (!$exampleClient) {
        return
    }
    $client = $exampleClient.Value
    $parts = $client -split '/',2
    $name = $parts[0]
    $version = $parts[1]
    $title = switch ($name) {
        'chrome'            { "Chrome $version" }
        'curl'              { "Curl $version" }
        'dotnet'            { ".NET $version" }
        'dotnetframework'   { ".NET Framework $version" }
        'electron'          { "Electron $version" }
        'erlang'            { "Erlang $version" }
        'firefox'           { "Firefox $version" }
        'go'                { "Go $version" }
        'java'              { "Java $version" }
        'nodejs'            { "Node.js $version" }
        'nwjs'              { "NW.js $version" }
        'rust'              { "Rust $version" }
        default             { return }
    }
    [PSCustomObject]@{
        Client = $client
        Title = $title
        Name = $name
        Version = $version
        Lines = $lines
    }
}

function Get-Summary($windowsVersion) {
    $summaries = Get-Content c:\tls-dump-clienthello\*-stderr.log | ForEach-Object -Begin {
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
    } | Sort-Object Title

    @"
# Example $($windowsVersion.Name) ($($windowsVersion.Version)) outputs

"@
    $summaries | ForEach-Object {
        @"
* [$($_.Title)](#$($_.Title.ToLowerInvariant() -replace '[^a-z0-9 ]','' -replace '[ ]','-'))
"@
    }
    $summaries | ForEach-Object {
        @"

## $($_.Title)
"@
        if ($_.Name -match '(chrome|firefox)') {
            @"

With [example-clients/browser](example-clients/browser).
"@
        } elseif ($_.Name -eq 'dotnet') {
            @"

With [example-clients/dotnet](example-clients/dotnet):

``````csharp
await new HttpClient().GetStringAsync("https://example.com:8888");
``````
"@
        } elseif ($_.Name -eq 'dotnetframework') {
            @"

With [example-clients/dotnetframework](example-clients/dotnetframework):

``````csharp
new WebClient().DownloadString("https://example.com:8888");
``````
"@
        } elseif ($_.Name -eq 'go') {
            @"

With [example-clients/go](example-clients/go):

``````go
http.Get("https://example.com:8888")
``````
"@
        } elseif ($_.Name -eq 'java') {
            @"

With [example-clients/java](example-clients/java):

``````java
new URL("https://example.com:8888")
    .openConnection()
    .getInputStream()
    .close();
``````
"@
        } else {
    @"

With [example-clients/$($_.Name)](example-clients/$($_.Name)).
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

[System.IO.File]::WriteAllText(
    "c:\vagrant\example-clients-output-$($windowsVersion.Name.ToLowerInvariant() -replace ' ','-')-$($windowsVersion.Version.ToLowerInvariant()).md",
    ($summary -join "`n" -replace "`r`n","`n"),
    (New-Object System.Text.UTF8Encoding $False))

Write-Output $summary
