# Example Windows Server 2022 (21H2) outputs

* [.NET 6.0.12](#net-6012)
* [.NET Framework 4.8.4515.0](#net-framework-4845150)
* [Chrome 108.0.5359.125](#chrome-10805359125)
* [Curl 7.86.0](#curl-7860)
* [Electron 22.0.0 (node/16.17.1 chrome/108.0.5359.62)](#electron-2200-node16171-chrome1080535962)
* [Erlang 25](#erlang-25)
* [Firefox 107.0](#firefox-1070)
* [Go 1.19.4](#go-1194)
* [Java 11.0.17+8](#java-110178)
* [Node.js 18.12.1](#nodejs-18121)
* [NW.js 0.71.0 (node/19.0.0 chromium/108.0.5359.95)](#nwjs-0710-node1900-chromium1080535995)
* [Rust 1.66.0](#rust-1660)

## .NET 6.0.12

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
client cipher suite: TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (0x009f)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
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
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
http: GET /?example-client=dotnet%2F6.0.12 HTTP/1.1
http header: Host: example.com:8888
http query: example-client=dotnet/6.0.12
```

## .NET Framework 4.8.4515.0

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
client cipher suite: TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (0x009f)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
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
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
http: GET /?example-client=dotnetframework%2F4.8.4515.0 HTTP/1.1
http header: Host: example.com:8888
http header: Connection: Keep-Alive
http query: example-client=dotnetframework/4.8.4515.0
```

## Chrome 108.0.5359.125

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
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=chrome%2F108.0.5359.125 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
http header: Accept-Encoding: gzip, deflate, br
http header: Sec-Fetch-Dest: document
http header: Sec-Fetch-Mode: navigate
http header: Sec-Fetch-Site: none
http header: Sec-Fetch-User: ?1
http header: Upgrade-Insecure-Requests: 1
http header: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/108.0.5359.125 Safari/537.36
http query: example-client=chrome/108.0.5359.125
```

## Curl 7.86.0

With [example-clients/curl](example-clients/curl).

Outputs:

```
client SNI: example.com
client version: TLSv1.3
client version: TLSv1.2
client version: TLSv1.1
client version: TLSv1.0
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
client cipher suite: TLS_EMPTY_RENEGOTIATION_INFO_SCSV (0x00ff)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: x448 (30)
client curve: secp521r1 (25)
client curve: secp384r1 (24)
client point: uncompressed (0)
client point: ansiX962_compressed_prime (1)
client point: ansiX962_compressed_char2 (2)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=curl%2f7.86.0 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: */*
http header: User-Agent: curl/7.86.0
http query: example-client=curl/7.86.0
```

## Electron 22.0.0 (node/16.17.1 chrome/108.0.5359.62)

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
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=electron%2F22.0.0+%28node%2F16.17.1+chrome%2F108.0.5359.62%29 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
http header: Accept-Encoding: gzip, deflate, br
http header: Accept-Language: en-US
http header: Sec-Fetch-Dest: document
http header: Sec-Fetch-Mode: navigate
http header: Sec-Fetch-Site: none
http header: Sec-Fetch-User: ?1
http header: Upgrade-Insecure-Requests: 1
http header: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) example-electron-client/1.0.0 Chrome/108.0.5359.62 Electron/22.0.0 Safari/537.36
http query: example-client=electron/22.0.0 (node/16.17.1 chrome/108.0.5359.62)
```

## Erlang 25

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
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 (0xc024)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (0xc028)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CCM (0xc0ac)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CCM_8 (0xc0ae)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02e)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384 (0xc032)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384 (0xc026)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384 (0xc02a)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02d)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256 (0xc031)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 (0xc023)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (0xc027)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256 (0xc025)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256 (0xc029)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (0x009f)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_GCM_SHA384 (0x00a3)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 (0x006b)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA256 (0x006a)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_GCM_SHA256 (0x00a2)
client cipher suite: TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xccaa)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA256 (0x0067)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA256 (0x0040)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA (0xc005)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_CBC_SHA (0xc00f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA (0xc004)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_CBC_SHA (0xc00e)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA (0x0039)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA (0x0038)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA (0x0033)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA (0x0032)
client curve: x25519 (29)
client curve: x448 (30)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
http: GET /?example-client=erlang%2F25 HTTP/1.1
http header: Host: example.com:8888
http header: Connection: keep-alive
http header: Content-Length: 0
http header: Te: 
http query: example-client=erlang/25
```

## Firefox 107.0

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
http: GET /?example-client=firefox%2F107.0 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
http header: Accept-Encoding: gzip, deflate, br
http header: Accept-Language: en-US,en;q=0.5
http header: Sec-Fetch-Dest: document
http header: Sec-Fetch-Mode: navigate
http header: Sec-Fetch-Site: cross-site
http header: Te: trailers
http header: Upgrade-Insecure-Requests: 1
http header: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0
http query: example-client=firefox/107.0
```

## Go 1.19.4

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
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA (0xc012)
client cipher suite: TLS_RSA_WITH_3DES_EDE_CBC_SHA (0x000a)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client curve: secp521r1 (25)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=go%2F1.19.4 HTTP/2.0
http header: Host: example.com:8888
http header: Accept-Encoding: gzip
http header: User-Agent: Go-http-client/2.0
http query: example-client=go/1.19.4
```

## Java 11.0.17+8

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
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02e)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384 (0xc032)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02d)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256 (0xc031)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384 (0xc026)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384 (0xc02a)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256 (0xc025)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256 (0xc029)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA (0x0039)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA (0x0038)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA (0x0033)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA (0x0032)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA (0xc005)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_CBC_SHA (0xc00f)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA (0xc004)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_CBC_SHA (0xc00e)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA256 (0x003d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA256 (0x003c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
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
http: GET /?example-client=java%2F11.0.17%2B8 HTTP/1.1
http header: Host: example.com:8888
http header: Accept: text/html, image/gif, image/jpeg, *; q=.2, */*; q=.2
http header: Connection: keep-alive
http header: User-Agent: Java/11.0.17
http query: example-client=java/11.0.17+8
```

## Node.js 18.12.1

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
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CCM_8 (0xc0af)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CCM (0xc0ad)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CCM_8 (0xc0a3)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CCM (0xc09f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_ARIA_256_GCM_SHA384 (0xc05d)
client cipher suite: TLS_ECDHE_RSA_WITH_ARIA_256_GCM_SHA384 (0xc061)
client cipher suite: TLS_DHE_DSS_WITH_ARIA_256_GCM_SHA384 (0xc057)
client cipher suite: TLS_DHE_RSA_WITH_ARIA_256_GCM_SHA384 (0xc053)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_GCM_SHA256 (0x00a2)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CCM_8 (0xc0ae)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CCM (0xc0ac)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CCM_8 (0xc0a2)
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
client cipher suite: TLS_RSA_WITH_AES_256_CCM_8 (0xc0a1)
client cipher suite: TLS_RSA_WITH_AES_256_CCM (0xc09d)
client cipher suite: TLS_RSA_WITH_ARIA_256_GCM_SHA384 (0xc051)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_128_CCM_8 (0xc0a0)
client cipher suite: TLS_RSA_WITH_AES_128_CCM (0xc09c)
client cipher suite: TLS_RSA_WITH_ARIA_128_GCM_SHA256 (0xc050)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA256 (0x003d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA256 (0x003c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_EMPTY_RENEGOTIATION_INFO_SCSV (0x00ff)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: x448 (30)
client curve: secp521r1 (25)
client curve: secp384r1 (24)
client curve: ffdhe2048 (256)
client curve: ffdhe3072 (257)
client curve: ffdhe4096 (258)
client curve: ffdhe6144 (259)
client curve: ffdhe8192 (260)
client point: uncompressed (0)
client point: ansiX962_compressed_prime (1)
client point: ansiX962_compressed_char2 (2)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
http: GET /?example-client=nodejs%2F18.12.1 HTTP/1.1
http header: Host: example.com:8888
http header: Accept: */*
http header: Accept-Encoding: gzip, deflate, br
http header: Connection: close
http header: User-Agent: node-fetch
http query: example-client=nodejs/18.12.1
```

## NW.js 0.71.0 (node/19.0.0 chromium/108.0.5359.95)

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
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol: h2
http: GET /?example-client=nwjs%2F0.71.0+%28node%2F19.0.0+chromium%2F108.0.5359.95%29 HTTP/2.0
http header: Host: example.com:8888
http header: Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
http header: Accept-Encoding: gzip, deflate, br
http header: Accept-Language: en-US,en;q=0.9
http header: Sec-Ch-Ua: "Not?A_Brand";v="8", "Chromium";v="108"
http header: Sec-Ch-Ua-Mobile: ?0
http header: Sec-Ch-Ua-Platform: "Windows"
http header: Sec-Fetch-Dest: document
http header: Sec-Fetch-Mode: navigate
http header: Sec-Fetch-Site: cross-site
http header: Sec-Fetch-User: ?1
http header: Upgrade-Insecure-Requests: 1
http header: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36
http query: example-client=nwjs/0.71.0 (node/19.0.0 chromium/108.0.5359.95)
```

## Rust 1.66.0

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
http: GET /?example-client=rust%2F1.66.0 HTTP/1.1
http header: Host: example.com:8888
http header: Accept: */*
http header: Accept-Encoding: gzip
http header: User-Agent: ureq/2.5.0
http query: example-client=rust/1.66.0
```