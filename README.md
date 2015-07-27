this dumps the [TLS ClientHello message](https://tools.ietf.org/html/rfc5246#section-7.4.1.2) to stdout. this might be useful when testing your TLS client settings.

this uses a modified version of the Go [crypto/tls package](https://github.com/golang/go/tree/master/src/crypto/tls).

# Example outputs

## Go 1.4.2

With:

```go
http.Get("https://example.com:8888")
```

Outputs:

```
client version: TLSv1.2
client SNI: localhost
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_RC4_128_SHA (0xc011)
client cipher suite: TLS_ECDHE_ECDSA_WITH_RC4_128_SHA (0xc007)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_RSA_WITH_RC4_128_SHA (0x0005)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA (0xc012)
client cipher suite: TLS_RSA_WITH_3DES_EDE_CBC_SHA (0x000a)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client curve: secp521r1 (25)
client point: uncompressed (0)
```

## .NET 4.5.2 (default settings)

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

## .NET 4.5.2 (custom settings)

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

## Java 8

With:

```java
new URL("https://example.com:8888")
    .openConnection()
    .getInputStream()
    .close();
```

Outputs:

```
client version: TLSv1.2
client SNI: example.com
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
client cipher suite: TLS_ECDHE_ECDSA_WITH_RC4_128_SHA (0xc007)
client cipher suite: TLS_ECDHE_RSA_WITH_RC4_128_SHA (0xc011)
client cipher suite: TLS_RSA_WITH_RC4_128_SHA (0x0005)
client cipher suite: TLS_ECDH_ECDSA_WITH_RC4_128_SHA (0xc002)
client cipher suite: TLS_ECDH_RSA_WITH_RC4_128_SHA (0xc00c)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02d)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256 (0xc031)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_GCM_SHA256 (0x00a2)
client cipher suite: TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA (0xc008)
client cipher suite: TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA (0xc012)
client cipher suite: TLS_RSA_WITH_3DES_EDE_CBC_SHA (0x000a)
client cipher suite: TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA (0xc003)
client cipher suite: TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA (0xc00d)
client cipher suite: TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA (0x0016)
client cipher suite: TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA (0x0013)
client cipher suite: TLS_RSA_WITH_RC4_128_MD5 (0x0004)
client cipher suite: TLS_EMPTY_RENEGOTIATION_INFO_SCSV (0x00ff)
client curve: secp256r1 (23)
client curve: sect163k1 (1)
client curve: sect163r2 (3)
client curve: secp192r1 (19)
client curve: secp224r1 (21)
client curve: sect233k1 (6)
client curve: sect233r1 (7)
client curve: sect283k1 (9)
client curve: sect283r1 (10)
client curve: secp384r1 (24)
client curve: sect409k1 (11)
client curve: sect409r1 (12)
client curve: secp521r1 (25)
client curve: sect571k1 (13)
client curve: sect571r1 (14)
client curve: secp160k1 (15)
client curve: secp160r1 (16)
client curve: secp160r2 (17)
client curve: sect163r1 (2)
client curve: secp192k1 (18)
client curve: sect193r1 (4)
client curve: sect193r2 (5)
client curve: secp224k1 (20)
client curve: sect239k1 (8)
client curve: secp256k1 (22)
client point: uncompressed (0)
```

## Firefox 39

```
client version: TLSv1.2
client SNI: example.com
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA (0x0033)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA (0x0039)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_RSA_WITH_3DES_EDE_CBC_SHA (0x000a)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client curve: secp521r1 (25)
client point: uncompressed (0)
```

## Chrome 44

```
client version: TLSv1.2
client SNI: example.com
client cipher suite: TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (0xcc14)
client cipher suite: TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcc13)
client cipher suite: TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (0xcc15)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA (0x0039)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA (0x0033)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_RSA_WITH_3DES_EDE_CBC_SHA (0x000a)
client cipher suite: TLS_EMPTY_RENEGOTIATION_INFO_SCSV (0x00ff)
client curve: secp256r1 (23)
client curve: secp384r1 (24)
client point: uncompressed (0)
```

## curl 7.42.1

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

# httpie 0.9.2

```
client version: TLSv1.2
client SNI: example.com
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (0xc030)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384 (0xc032)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02e)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256 (0xc031)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02d)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_GCM_SHA384 (0x00a3)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (0x009f)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_GCM_SHA256 (0x00a2)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (0x009e)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (0xc028)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 (0xc024)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (0xc014)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA (0xc00a)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384 (0xc02a)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384 (0xc026)
client cipher suite: TLS_ECDH_RSA_WITH_AES_256_CBC_SHA (0xc00f)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA (0xc005)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 (0x006b)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA256 (0x006a)
client cipher suite: TLS_DHE_RSA_WITH_AES_256_CBC_SHA (0x0039)
client cipher suite: TLS_DHE_DSS_WITH_AES_256_CBC_SHA (0x0038)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (0xc027)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 (0xc023)
client cipher suite: TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (0xc013)
client cipher suite: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA (0xc009)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256 (0xc029)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256 (0xc025)
client cipher suite: TLS_ECDH_RSA_WITH_AES_128_CBC_SHA (0xc00e)
client cipher suite: TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA (0xc004)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA256 (0x0067)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA256 (0x0040)
client cipher suite: TLS_DHE_RSA_WITH_AES_128_CBC_SHA (0x0033)
client cipher suite: TLS_DHE_DSS_WITH_AES_128_CBC_SHA (0x0032)
client cipher suite: TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA (0xc012)
client cipher suite: TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA (0xc008)
client cipher suite: TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA (0xc00d)
client cipher suite: TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA (0xc003)
client cipher suite: TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA (0x0088)
client cipher suite: TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA (0x0087)
client cipher suite: TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA (0x0045)
client cipher suite: TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA (0x0044)
client cipher suite: TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA (0x0016)
client cipher suite: TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA (0x0013)
client cipher suite: TLS_RSA_WITH_AES_256_GCM_SHA384 (0x009d)
client cipher suite: TLS_RSA_WITH_AES_128_GCM_SHA256 (0x009c)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA256 (0x003d)
client cipher suite: TLS_RSA_WITH_AES_256_CBC_SHA (0x0035)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA256 (0x003c)
client cipher suite: TLS_RSA_WITH_AES_128_CBC_SHA (0x002f)
client cipher suite: TLS_RSA_WITH_CAMELLIA_256_CBC_SHA (0x0084)
client cipher suite: TLS_RSA_WITH_CAMELLIA_128_CBC_SHA (0x0041)
client cipher suite: TLS_RSA_WITH_3DES_EDE_CBC_SHA (0x000a)
client cipher suite: TLS_EMPTY_RENEGOTIATION_INFO_SCSV (0x00ff)
client curve: sect571r1 (14)
client curve: sect571k1 (13)
client curve: secp521r1 (25)
client curve: sect409k1 (11)
client curve: sect409r1 (12)
client curve: secp384r1 (24)
client curve: sect283k1 (9)
client curve: sect283r1 (10)
client curve: secp256k1 (22)
client curve: secp256r1 (23)
client curve: sect239k1 (8)
client curve: sect233k1 (6)
client curve: sect233r1 (7)
client curve: secp224k1 (20)
client curve: secp224r1 (21)
client curve: sect193r1 (4)
client curve: sect193r2 (5)
client curve: secp192k1 (18)
client curve: secp192r1 (19)
client curve: sect163k1 (1)
client curve: sect163r1 (2)
client curve: sect163r2 (3)
client curve: secp160k1 (15)
client curve: secp160r1 (16)
client curve: secp160r2 (17)
client point: uncompressed (0)
client point: ansiX962_compressed_prime (1)
client point: ansiX962_compressed_char2 (2)
```
