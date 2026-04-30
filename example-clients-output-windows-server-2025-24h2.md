# Example Windows Server 2025 (24H2) outputs

**NB** Also see the [Windows Schannel Provider Supported Cipher Suites](https://learn.microsoft.com/en-us/windows/win32/secauthn/tls-cipher-suites-in-windows-server-2025).

* [.NET 10.0.7](#net-1007)
* [.NET Framework 4.8.9325.0](#net-framework-4893250)
* [Chrome 147.0.7727.117](#chrome-14707727117)
* [Curl 8.19.0](#curl-8190)
* [Electron 41.3.0 (node/24.15.0 chrome/146.0.7680.188)](#electron-4130-node24150-chrome14607680188)
* [Erlang 28](#erlang-28)
* [Firefox 148.0.2](#firefox-14802)
* [Go 1.26.2](#go-1262)
* [Java 25.0.1+8-LTS](#java-25018lts)
* [Node.js 24.15.0](#nodejs-24150)
* [NW.js 0.110.1 (node/25.8.2 chromium/147.0.7727.24)](#nwjs-01101-node2582-chromium1470772724)
* [Rust 1.95.0](#rust-1950)

## .NET 10.0.7

With [example-clients/dotnet](example-clients/dotnet):

```csharp
await new HttpClient().GetStringAsync("https://example.com:8888");
```

Outputs:

```
client SNI: example.com
client version: TLSv1.3
client version: TLSv1.2
client version: TLSv1.1
client version: TLSv1.0
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 (0xc024)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 (0xc023)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (0xc028)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (0xc027)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA256 (0x003d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA256 (0x003c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
http: GET /?example-client=dotnet%2F10.0.7 HTTP/1.1
http header: Host: example.com:8888
http query: example-client=dotnet/10.0.7
```

## .NET Framework 4.8.9325.0

With [example-clients/dotnetframework](example-clients/dotnetframework):

```csharp
new WebClient().DownloadString("https://example.com:8888");
```

Outputs:

```
client SNI: example.com
client version: TLSv1.3
client version: TLSv1.2
client version: TLSv1.1
client version: TLSv1.0
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 (0xc024)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 (0xc023)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (0xc028)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (0xc027)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA256 (0x003d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA256 (0x003c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
http: GET /?example-client=dotnetframework%2F4.8.9325.0 HTTP/1.1
http header: Host: example.com:8888
http header: Connection: Keep-Alive
http query: example-client=dotnetframework/4.8.9325.0
```

## Chrome 147.0.7727.117

With [example-clients/browser](example-clients/browser).

Outputs:

```
client SNI: example.com
client version: 0xfafa
client version: TLSv1.3
client version: TLSv1.2
client cipher suite: Reserved (0x6a6a)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client curve: Reserved (19018)
client curve: X25519MLKEM768 (4588)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=chrome%2F147.0.7727.117 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
http header: Accept-Encoding: gzip, deflate, br, zstd
http header: Accept-Language: en-US,en;q=0.9
http header: Priority: u=0, i
http header: Sec-Ch-Ua: "Google Chrome";v="147", "Not.A/Brand";v="8", "Chromium";v="147"
http header: Sec-Ch-Ua-Mobile: ?0
http header: Sec-Ch-Ua-Platform: "Windows"
http header: Sec-Fetch-Dest: document
http header: Sec-Fetch-Mode: navigate
http header: Sec-Fetch-Site: none
http header: Sec-Fetch-User: ?1
http header: Upgrade-Insecure-Requests: 1
http header: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/147.0.0.0 Safari/537.36
http query: example-client=chrome/147.0.7727.117
```

## Curl 8.19.0

With [example-clients/curl](example-clients/curl).

Outputs:

```
client SNI: example.com
client version: TLSv1.3
client version: TLSv1.2
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (0x009f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xccaa)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 (0xc024)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (0xc028)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 (0x006b)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 (0xc023)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (0xc027)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA256 (0x0067)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA (0x0039)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA (0x0033)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA256 (0x003d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA256 (0x003c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client curve: X25519MLKEM768 (4588)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: x448 (30)
client curve: secp384r1 (24)
client curve: secp521r1 (25)
client curve: ffdhe2048 (256)
client curve: ffdhe3072 (257)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=curl%2f8.19.0 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: */*
http header: User-Agent: curl/8.19.0
http query: example-client=curl/8.19.0
```

## Electron 41.3.0 (node/24.15.0 chrome/146.0.7680.188)

With [example-clients/electron](example-clients/electron).

Outputs:

```
client SNI: example.com
client version: 0x9a9a
client version: TLSv1.3
client version: TLSv1.2
client cipher suite: Reserved (0x7a7a)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client curve: Reserved (2570)
client curve: X25519MLKEM768 (4588)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=electron%2F41.3.0+%28node%2F24.15.0+chrome%2F146.0.7680.188%29 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
http header: Accept-Encoding: gzip, deflate, br, zstd
http header: Accept-Language: en-US
http header: Priority: u=0, i
http header: Sec-Fetch-Dest: document
http header: Sec-Fetch-Mode: navigate
http header: Sec-Fetch-Site: none
http header: Sec-Fetch-User: ?1
http header: Upgrade-Insecure-Requests: 1
http header: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) example-electron-client/1.0.0 Chrome/146.0.7680.188 Electron/41.3.0 Safari/537.36
http query: example-client=electron/41.3.0 (node/24.15.0 chrome/146.0.7680.188)
```

## Erlang 28

With [example-clients/erlang](example-clients/erlang).

Outputs:

```
client SNI: example.com
client version: TLSv1.3
client version: TLSv1.2
client cipher suite: TLS_EMPTY_RENEGOTIATION_INFO_SCSV (0x00ff)
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client cipher suite: TLS_AES_128_CCM_SHA256 (0x1304)
client cipher suite: TLS_AES_128_CCM_8_SHA256 (0x1305)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CCM (0xc0ad)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CCM_8 (0xc0af)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CCM (0xc0ac)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CCM_8 (0xc0ae)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02e)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384 (0xc032)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02d)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256 (0xc031)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (0x009f)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_GCM_SHA384 (0x00a3)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_GCM_SHA256 (0x00a2)
client cipher suite: TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xccaa)
client curve: x25519 (29)
client curve: x448 (30)
client curve: secp521r1 (25)
client curve: secp384r1 (24)
client curve: secp256r1 (23)
client curve: brainpoolP512r1tls13 (33)
client curve: brainpoolP384r1tls13 (32)
client curve: brainpoolP256r1tls13 (31)
client curve: MLKEM512 (512)
client curve: MLKEM768 (513)
client curve: MLKEM1024 (514)
client curve: X25519MLKEM768 (4588)
client curve: SecP384r1MLKEM1024 (4589)
client curve: SecP256r1MLKEM768 (4587)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
http: GET /?example-client=erlang%2F28 HTTP/1.1
http header: Host: example.com:8888
http header: Connection: keep-alive
http query: example-client=erlang/28
```

## Firefox 148.0.2

With [example-clients/browser](example-clients/browser).

Outputs:

```
client SNI: example.com
client version: TLSv1.3
client version: TLSv1.2
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client curve: X25519MLKEM768 (4588)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client curve: secp521r1 (25)
client curve: ffdhe2048 (256)
client curve: ffdhe3072 (257)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=firefox%2F148.0.2 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
http header: Accept-Encoding: gzip, deflate, br, zstd
http header: Accept-Language: undefined
http header: Priority: u=0, i
http header: Sec-Fetch-Dest: document
http header: Sec-Fetch-Mode: navigate
http header: Sec-Fetch-Site: none
http header: Sec-Fetch-User: ?1
http header: Te: trailers
http header: Upgrade-Insecure-Requests: 1
http header: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:148.0) Gecko/20100101 Firefox/148.0
http query: example-client=firefox/148.0.2
```

## Go 1.26.2

With [example-clients/go](example-clients/go):

```go
http.Get("https://example.com:8888")
```

Outputs:

```
client SNI: example.com
client version: TLSv1.3
client version: TLSv1.2
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client curve: X25519MLKEM768 (4588)
client curve: SecP256r1MLKEM768 (4587)
client curve: SecP384r1MLKEM1024 (4589)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client curve: secp521r1 (25)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=go%2F1.26.2 HTTP/2.0
http header: Host: example.com:8888
http header: Accept-Encoding: gzip
http header: User-Agent: Go-http-client/2.0
http query: example-client=go/1.26.2
```

## Java 25.0.1+8-LTS

With [example-clients/java](example-clients/java):

```java
new URL("https://example.com:8888")
    .openConnection()
    .getInputStream()
    .close();
```

Outputs:

```
client SNI: example.com
client version: TLSv1.3
client version: TLSv1.2
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (0x009f)
client cipher suite: TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xccaa)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_GCM_SHA384 (0x00a3)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_GCM_SHA256 (0x00a2)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 (0xc024)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (0xc028)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 (0xc023)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (0xc027)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 (0x006b)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA256 (0x006a)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA256 (0x0067)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA256 (0x0040)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA (0x0039)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA (0x0038)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA (0x0033)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA (0x0032)
client cipher suite: TLS_EMPTY_RENEGOTIATION_INFO_SCSV (0x00ff)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client curve: secp521r1 (25)
client curve: x448 (30)
client curve: ffdhe2048 (256)
client curve: ffdhe3072 (257)
client curve: ffdhe4096 (258)
client curve: ffdhe6144 (259)
client curve: ffdhe8192 (260)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
http: GET /?example-client=java%2F25.0.1%2B8-LTS HTTP/1.1
http header: Host: example.com:8888
http header: Accept: */*
http header: Connection: keep-alive
http header: User-Agent: Java/25.0.1
http query: example-client=java/25.0.1+8-LTS
```

## Node.js 24.15.0

With [example-clients/nodejs](example-clients/nodejs).

Outputs:

```
client SNI: example.com
client version: TLSv1.3
client version: TLSv1.2
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (0xc027)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA256 (0x0067)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (0xc028)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 (0x006b)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_GCM_SHA384 (0x00a3)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (0x009f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xccaa)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CCM (0xc0ad)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CCM (0xc09f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_ARIA_256_GCM_SHA384 (0xc05d)
client cipher suite: TLS_ECDHE_RSA_WITH_ARIA_256_GCM_SHA384 (0xc061)
client cipher suite: TLS_DHE_DSS_WITH_ARIA_256_GCM_SHA384 (0xc057)
client cipher suite: TLS_DHE_RSA_WITH_ARIA_256_GCM_SHA384 (0xc053)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_GCM_SHA256 (0x00a2)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CCM (0xc0ac)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CCM (0xc09e)
client cipher suite: TLS_ECDHE_ECDSA_WITH_ARIA_128_GCM_SHA256 (0xc05c)
client cipher suite: TLS_ECDHE_RSA_WITH_ARIA_128_GCM_SHA256 (0xc060)
client cipher suite: TLS_DHE_DSS_WITH_ARIA_128_GCM_SHA256 (0xc056)
client cipher suite: TLS_DHE_RSA_WITH_ARIA_128_GCM_SHA256 (0xc052)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 (0xc024)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA256 (0x006a)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 (0xc023)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA256 (0x0040)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA (0x0039)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA (0x0038)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA (0x0033)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA (0x0032)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_256_CCM (0xc09d)
client cipher suite: TLS_RSA_WITH_ARIA_256_GCM_SHA384 (0xc051)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_128_CCM (0xc09c)
client cipher suite: TLS_RSA_WITH_ARIA_128_GCM_SHA256 (0xc050)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA256 (0x003d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA256 (0x003c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client curve: X25519MLKEM768 (4588)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: x448 (30)
client curve: secp384r1 (24)
client curve: secp521r1 (25)
client curve: ffdhe2048 (256)
client curve: ffdhe3072 (257)
client point: uncompressed (0)
client point: ansiX962_compressed_prime (1)
client point: ansiX962_compressed_char2 (2)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: http/1.1
http: GET /?example-client=nodejs%2F24.15.0 HTTP/1.1
http header: Host: example.com:8888
http header: Accept: */*
http header: Accept-Encoding: br, gzip, deflate
http header: Accept-Language: *
http header: Connection: keep-alive
http header: Sec-Fetch-Mode: cors
http header: User-Agent: node
http query: example-client=nodejs/24.15.0
```

## NW.js 0.110.1 (node/25.8.2 chromium/147.0.7727.24)

With [example-clients/nwjs](example-clients/nwjs).

Outputs:

```
client SNI: example.com
client version: 0xbaba
client version: TLSv1.3
client version: TLSv1.2
client cipher suite: Reserved (0x3a3a)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client curve: Reserved (35466)
client curve: X25519MLKEM768 (4588)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=nwjs%2F0.110.1+%28node%2F25.8.2+chromium%2F147.0.7727.24%29 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
http header: Accept-Encoding: gzip, deflate, br, zstd
http header: Accept-Language: en-US,en;q=0.9
http header: Priority: u=0, i
http header: Sec-Ch-Ua: "Chromium";v="147", "Not.A/Brand";v="8"
http header: Sec-Ch-Ua-Mobile: ?0
http header: Sec-Ch-Ua-Platform: "Windows"
http header: Sec-Fetch-Dest: document
http header: Sec-Fetch-Mode: navigate
http header: Sec-Fetch-Site: cross-site
http header: Sec-Fetch-User: ?1
http header: Upgrade-Insecure-Requests: 1
http header: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36
http query: example-client=nwjs/0.110.1 (node/25.8.2 chromium/147.0.7727.24)
```

## Rust 1.95.0

With [example-clients/rust](example-clients/rust).

Outputs:

```
client SNI: example.com
client version: TLSv1.3
client version: TLSv1.2
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_EMPTY_RENEGOTIATION_INFO_SCSV (0x00ff)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
http: GET /?example-client=rust%2F1.95.0 HTTP/1.1
http header: Host: example.com:8888
http header: Accept: */*
http header: Accept-Encoding: gzip
http header: User-Agent: ureq/3.3.0
http query: example-client=rust/1.95.0
```