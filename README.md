[![Build status](https://github.com/rgl/tls-dump-clienthello/workflows/Build/badge.svg)](https://github.com/rgl/tls-dump-clienthello/actions?query=workflow%3ABuild)

this dumps the [TLS ClientHello message](https://tools.ietf.org/html/rfc5246#section-7.4.1.2) to stdout. this might be useful when testing your TLS client settings.

# Usage

Install [Go 1.18.2](https://go.dev/dl/).

Add `example.com` to your `hosts` file:

```bash
echo '127.0.0.1 example.com' | sudo tee --append /etc/hosts >/dev/null
```

Build and launch the https server:

```bash
make
./dist/tls-dump-clienthello_$(go env GOOS)_$(go env GOARCH)_$(go env GOAMD64)/tls-dump-clienthello
```

Then open https://example.com in the client you want to test.

Open the [example-clients directory](example-clients) to see some example clients.

The example clients can also be executed in a Vagrant managed VM. See the [Vagrantfile](Vagrantfile) (this requires the base boxes from [rgl/windows-vagrant](https://github.com/rgl/windows-vagrant)).

# Example clients output

* [Windows Server 2019 (1809)](example-clients-output-windows-server-2019-1809.md)
* [Windows Server 2022 (21H2)](example-clients-output-windows-server-2022-21h2.md)
