SHELL = /bin/bash
ifeq ($(OS),Windows_NT)
EXT = .exe
else
EXT =
endif
DIST_DEPS = $(shell echo tls-dump-clienthello${EXT} tls-parameters-{4,8,9}.csv example.com-{crt,key}.pem)

all: tls-parameters bin tls-dump-clienthello.zip

clean:
	rm -f tls-dump-clienthello*

bin: tls-dump-clienthello${EXT}

tls-dump-clienthello${EXT}: *.go
	go build -o $@ -ldflags "-s"

tls-dump-clienthello.zip: ${DIST_DEPS}
	zip $@ $^
	sha256sum $@

tls-parameters:
	wget -qO tls-parameters-4.csv https://www.iana.org/assignments/tls-parameters/tls-parameters-4.csv
	wget -qO tls-parameters-8.csv https://www.iana.org/assignments/tls-parameters/tls-parameters-8.csv
	wget -qO tls-parameters-9.csv https://www.iana.org/assignments/tls-parameters/tls-parameters-9.csv

example.com-crt.pem:
	./create-certificate.sh

.PHONY: all clean tls-parameters bin
