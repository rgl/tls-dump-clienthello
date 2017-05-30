#!/bin/bash
set -eux
openssl genrsa -out example.com-keypair.pem 2048
openssl req -new \
    -sha256 \
    -key example.com-keypair.pem \
    -out example.com-csr.pem \
    -subj /CN=example.com
openssl x509 -req \
    -sha256 \
    -signkey example.com-keypair.pem \
    -days 9999 \
    -extensions a \
    -extfile <(echo "[a]
        subjectAltName=DNS:example.com
        extendedKeyUsage=critical,serverAuth
    ") \
    -in  example.com-csr.pem \
    -out example.com-crt.pem
rm example.com-csr.pem
openssl x509 \
    -noout \
    -text \
    -in example.com-crt.pem
