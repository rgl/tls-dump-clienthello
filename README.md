this dumps the [TLS ClientHello message](https://tools.ietf.org/html/rfc5246#section-7.4.1.2) to stdout. this might be useful when testing your TLS client settings.

# Usage

Install [Go 1.15](https://golang.org/dl/).

Add `example.com` to your `hosts` file:

```bash
echo '127.0.0.1 example.com' | sudo tee --append /etc/hosts >/dev/null
```

Build and launch the https server:

```bash
make
./tls-dump-clienthello
```

Then open https://example.com in the client you want to test.

Open the [example-clients directory](example-clients) to see some example clients.

# Example outputs

## Go 1.15.0 (Ubuntu 20.04)

With [example-clients/go/main.go](example-clients/go/main.go):

```go
http.Get("https://example.com:8888")
```

Outputs:

```
client SNI: example.com
client version: TLSv1.3
client version: TLSv1.2
client version: TLSv1.1
client version: TLSv1.0
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA (0xc012)
client cipher suite: TLS_RSA_WITH_3DES_EDE_CBC_SHA (0x000a)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client curve: secp521r1 (25)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_CHACHA20_POLY1305_SHA256
handshake protocol: h2
```

## .NET Core 3.1.3 (Ubuntu 20.04)

With [example-clients/dotnet/Program.cs](example-clients/dotnet/Program.cs):

```csharp
new WebClient().DownloadString("https://example.com:8888");
```

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
handshake cipher suite: TLS_CHACHA20_POLY1305_SHA256
handshake protocol:
```

## .NET 4.5.2 (default settings; Windows)

With:

```csharp
new WebClient().DownloadString("https://example.com:8888");
```

Outputs:

```
client version: TLSv1.0
client SNI: example.com
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA (0x0038)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA (0x0032)
client cipher suite: TLS_RSA_WITH_3DES_EDE_CBC_SHA (0x000a)
client cipher suite: TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA (0x0013)
client cipher suite: TLS_RSA_WITH_RC4_128_SHA (0x0005)
client cipher suite: TLS_RSA_WITH_RC4_128_MD5 (0x0004)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
```

## .NET 4.5.2 (custom settings; Windows)

With:

```csharp
ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
                                     | SecurityProtocolType.Tls11
                                     | SecurityProtocolType.Tls12;

new WebClient().DownloadString("https://example.com:8888");
```

Outputs:

```
client version: TLSv1.2
client SNI: example.com
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (0xc028)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (0x009f)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 (0xc023)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (0xc027)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA256 (0x003d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA256 (0x003c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 (0xc024)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA256 (0x006a)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA256 (0x0040)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA (0x0038)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA (0x0032)
client cipher suite: TLS_RSA_WITH_3DES_EDE_CBC_SHA (0x000a)
client cipher suite: TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA (0x0013)
client cipher suite: TLS_RSA_WITH_RC4_128_SHA (0x0005)
client cipher suite: TLS_RSA_WITH_RC4_128_MD5 (0x0004)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
```

## Java 11.0.8 (Ubuntu 20.04)

With:

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
client version: TLSv1.1
client version: TLSv1.0
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02e)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384 (0xc032)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (0x009f)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_GCM_SHA384 (0x00a3)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02d)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256 (0xc031)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_GCM_SHA256 (0x00a2)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 (0xc024)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (0xc028)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA256 (0x003d)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384 (0xc026)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384 (0xc02a)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 (0x006b)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA256 (0x006a)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA (0xc005)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_CBC_SHA (0xc00f)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA (0x0039)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA (0x0038)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 (0xc023)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (0xc027)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA256 (0x003c)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256 (0xc025)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256 (0xc029)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA256 (0x0067)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA256 (0x0040)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA (0xc004)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_CBC_SHA (0xc00e)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA (0x0033)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA (0x0032)
client cipher suite: TLS_EMPTY_RENEGOTIATION_INFO_SCSV (0x00ff)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client curve: secp521r1 (25)
client curve: ffdhe2048 (256)
client curve: ffdhe3072 (257)
client curve: ffdhe4096 (258)
client curve: ffdhe6144 (259)
client curve: ffdhe8192 (260)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_AES_128_GCM_SHA256
handshake protocol:
```

## Firefox 79.0 (Ubuntu 20.04)

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
client cipher suite: TLS_RSA_WITH_3DES_EDE_CBC_SHA (0x000a)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client curve: secp521r1 (25)
client curve: ffdhe2048 (256)
client curve: ffdhe3072 (257)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_CHACHA20_POLY1305_SHA256
handshake protocol: h2
```

## Chrome 84.0.4147.125 (Ubuntu 20.04)

```
client SNI: example.com
client version: 0xdada
client version: TLSv1.3
client version: TLSv1.2
client version: TLSv1.1
client version: TLSv1.0
client cipher suite: Reserved (0x0a0a)
client cipher suite: TLS_CHACHA20_POLY1305_SHA256 (0x1303)
client cipher suite: TLS_AES_128_GCM_SHA256 (0x1301)
client cipher suite: TLS_AES_256_GCM_SHA384 (0x1302)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client curve: Reserved (23130)
client curve: x25519 (29)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
handshake version: TLSv1.3
handshake cipher suite: TLS_CHACHA20_POLY1305_SHA256
handshake protocol: h2
```

**NB** The unknown/reserved cipher suite and curve that you see above is actually a feature, the [GREASE for TLS](https://www.chromestatus.com/feature/6475903378915328) feature.

## curl 7.68.0 (Ubuntu 20.04)

With:

```bash
CURL_CA_BUNDLE=example.com-crt.pem curl https://example.com:8888
```

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
handshake cipher suite: TLS_CHACHA20_POLY1305_SHA256
handshake protocol: h2
```

# httpie 1.0.3 (Ubuntu 20.04)

With:

```bash
CURL_CA_BUNDLE=example.com-crt.pem http https://example.com:8888
```

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
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca9)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcca8)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (0x009f)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
client cipher suite: TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xccaa)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CCM_8 (0xc0af)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CCM (0xc0ad)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CCM_8 (0xc0ae)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CCM (0xc0ac)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 (0xc024)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (0xc028)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 (0xc023)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (0xc027)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CCM_8 (0xc0a3)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CCM (0xc09f)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CCM_8 (0xc0a2)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CCM (0xc09e)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 (0x006b)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA256 (0x0067)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA (0x0039)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA (0x0033)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_CCM_8 (0xc0a1)
client cipher suite: TLS_RSA_WITH_AES_256_CCM (0xc09d)
client cipher suite: TLS_RSA_WITH_AES_128_CCM_8 (0xc0a0)
client cipher suite: TLS_RSA_WITH_AES_128_CCM (0xc09c)
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
handshake cipher suite: TLS_CHACHA20_POLY1305_SHA256
handshake protocol:
```
