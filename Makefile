SHELL = /bin/bash
EXT = .exe
DIST_DEPS = $(shell echo tls-dump-clienthello${EXT} tls-parameters-{4,8,9}.csv example.com-{crt,keypair}.pem)

all: tls-dump-clienthello${EXT} tls-dump-clienthello.zip

clean:
	rm -f tls-dump-clienthello*

tls-dump-clienthello${EXT}: *.go
	go build -o $@ -ldflags "-s"

tls-dump-clienthello.zip: ${DIST_DEPS}
	zip $@ $^

example.com-crt.pem:
	./create-certificate.sh

.PHONY: all clean
