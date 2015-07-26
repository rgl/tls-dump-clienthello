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
	openssl genrsa -out example.com-keypair.pem 2048
	openssl req -new \
		-sha256 \
		-key example.com-keypair.pem \
		-out example.com-csr.pem \
		-subj //C=PT/CN=example.com
	openssl x509 -req \
		-sha256 \
		-signkey example.com-keypair.pem \
		-days 9999 \
		-in  example.com-csr.pem \
		-out example.com-crt.pem
	rm example.com-csr.pem
	openssl x509 \
		-noout \
		-text \
		-in example.com-crt.pem

.PHONY: all clean
