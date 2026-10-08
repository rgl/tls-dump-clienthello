# Example Windows Server 2025 (24H2) outputs

**NB** Also see the [Windows Schannel Provider Supported Cipher Suites](https://learn.microsoft.com/en-us/windows/win32/secauthn/tls-cipher-suites-in-windows-server-2025).

* [.NET 10.0.12](#net-10012)
* [.NET Framework 4.8.9345.0](#net-framework-4893450)
* [Chrome 155.0.8059.40](#chrome-1550805940)
* [Curl 8.22.0](#curl-8220)
* [Electron 44.7.0 (node/24.21.0 chrome/152.0.7977.130)](#electron-4470-node24210-chrome15207977130)
* [Erlang 29](#erlang-29)
* [Firefox 157.0](#firefox-1570)
* [Go 1.27.1](#go-1271)
* [Java 25.0.1+8-LTS](#java-25018lts)
* [Node.js 24.21.0](#nodejs-24210)
* [NW.js 0.117.0 (node/26.7.0 chromium/154.0.8037.58)](#nwjs-01170-node2670-chromium1540803758)
* [Rust 1.98.1](#rust-1981)

## .NET 10.0.12

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
http: GET /?example-client=dotnet%2F10.0.12 HTTP/1.1
http header: Host: example.com:8888
http query: example-client=dotnet/10.0.12
```

## .NET Framework 4.8.9345.0

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
http: GET /?example-client=dotnetframework%2F4.8.9345.0 HTTP/1.1
http header: Host: example.com:8888
http header: Connection: Keep-Alive
http query: example-client=dotnetframework/4.8.9345.0
```

## Chrome 155.0.8059.40

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
http: GET /?example-client=chrome%2F155.0.8059.40 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/jxl,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
http header: Accept-Encoding: gzip, deflate, br, zstd
http header: Accept-Language: en-US,en;q=0.9
http header: Priority: u=0, i
http header: Sec-Ch-Ua: "Google Chrome";v="155", "Chromium";v="155", "Not(A:Brand";v="24"
http header: Sec-Ch-Ua-Mobile: ?0
http header: Sec-Ch-Ua-Platform: "Windows"
http header: Sec-Fetch-Dest: document
http header: Sec-Fetch-Mode: navigate
http header: Sec-Fetch-Site: none
http header: Sec-Fetch-User: ?1
http header: Upgrade-Insecure-Requests: 1
http header: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/155.0.0.0 Safari/537.36
http query: example-client=chrome/155.0.8059.40
```

## Curl 8.22.0

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
http: GET /?example-client=curl%2F8.22.0 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: */*
http header: User-Agent: curl/8.22.0
http query: example-client=curl/8.22.0
```

## Electron 44.7.0 (node/24.21.0 chrome/152.0.7977.130)

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
http: GET /?example-client=electron%2F44.7.0+%28node%2F24.21.0+chrome%2F152.0.7977.130%29 HTTP/2.0
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
http header: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) example-electron-client/1.0.0 Chrome/152.0.7977.130 Electron/44.7.0 Safari/537.36
http query: example-client=electron/44.7.0 (node/24.21.0 chrome/152.0.7977.130)
```

## Erlang 29

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
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CCM (0xc0ad)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CCM (0xc0ac)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02e)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384 (0xc032)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02d)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256 (0xc031)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (0x009f)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_GCM_SHA384 (0x00a3)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_GCM_SHA256 (0x00a2)
client cipher suite: TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xccaa)
client curve: X25519MLKEM768 (4588)
client curve: x25519 (29)
client curve: x448 (30)
client curve: secp521r1 (25)
client curve: secp384r1 (24)
client curve: secp256r1 (23)
client curve: brainpoolP512r1tls13 (33)
client curve: brainpoolP384r1tls13 (32)
client curve: brainpoolP256r1tls13 (31)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
http: GET /?example-client=erlang%2F29 HTTP/1.1
http header: Host: example.com:8888
http header: Connection: keep-alive
http query: example-client=erlang/29
```

## Firefox 157.0

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
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=firefox%2F157.0 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
http header: Accept-Encoding: gzip, deflate, br, zstd
http header: Accept-Language: en-US,en;q=0.9
http header: Priority: u=0, i
http header: Sec-Fetch-Dest: document
http header: Sec-Fetch-Mode: navigate
http header: Sec-Fetch-Site: none
http header: Sec-Fetch-User: ?1
http header: Te: trailers
http header: Upgrade-Insecure-Requests: 1
http header: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:157.0) Gecko/20100101 Firefox/157.0
http query: example-client=firefox/157.0
```

## Go 1.27.1

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
http: GET /?example-client=go%2F1.27.1 HTTP/2.0
http header: Host: example.com:8888
http header: Accept-Encoding: gzip
http header: User-Agent: Go-http-client/2.0
http query: example-client=go/1.27.1
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

## Node.js 24.21.0

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
http: GET /?example-client=nodejs%2F24.21.0 HTTP/1.1
http header: Host: example.com:8888
http header: Accept: */*
http header: Accept-Encoding: br, gzip, deflate
http header: Accept-Language: *
http header: Connection: keep-alive
http header: Sec-Fetch-Mode: cors
http header: User-Agent: node
http query: example-client=nodejs/24.21.0
```

## NW.js 0.117.0 (node/26.7.0 chromium/154.0.8037.58)

With [example-clients/nwjs](example-clients/nwjs).

Outputs:

```
client SNI: example.com
client version: 0x6a6a
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
client curve: Reserved (35466)
client curve: X25519MLKEM768 (4588)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=nwjs%2F0.117.0+%28node%2F26.7.0+chromium%2F154.0.8037.58%29 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
http header: Accept-Encoding: gzip, deflate, br, zstd
http header: Accept-Language: en-US,en;q=0.9
http header: Priority: u=0, i
http header: Sec-Ch-Ua: "Not A(Brand";v="99", "Chromium";v="154"
http header: Sec-Ch-Ua-Mobile: ?0
http header: Sec-Ch-Ua-Platform: "Windows"
http header: Sec-Fetch-Dest: document
http header: Sec-Fetch-Mode: navigate
http header: Sec-Fetch-Site: cross-site
http header: Sec-Fetch-User: ?1
http header: Upgrade-Insecure-Requests: 1
http header: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36
http query: example-client=nwjs/0.117.0 (node/26.7.0 chromium/154.0.8037.58)
```

## Rust 1.98.1

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
http: GET /?example-client=rust%2F1.98.1 HTTP/1.1
http header: Host: example.com:8888
http header: Accept: */*
http header: Accept-Encoding: gzip
http header: User-Agent: ureq/3.4.2
http query: example-client=rust/1.98.1
```
