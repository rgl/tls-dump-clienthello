#!/bin/bash
set -eux

# create the example ca certificate.
openssl genrsa -out example-ca-key.pem 2048
openssl req -new \
    -sha256 \
    -key example-ca-key.pem \
    -out example-ca-csr.pem \
    -subj "/CN=Example CA"
openssl req \
    -noout \
    -text \
    -in example-ca-csr.pem
openssl x509 -req \
    -sha256 \
    -signkey example-ca-key.pem \
    -days 9999 \
    -extensions a \
    -extfile <(echo "[a]
        basicConstraints=critical,CA:TRUE,pathlen:0
        keyUsage=critical,digitalSignature,keyCertSign,cRLSign
    ") \
    -in  example-ca-csr.pem \
    -out example-ca-crt.pem
rm example-ca-csr.pem
openssl x509 \
    -noout \
    -text \
    -in example-ca-crt.pem

# create the example.com certificate.
openssl genrsa -out example.com-key.pem 2048
openssl req -new \
    -sha256 \
    -key example.com-key.pem \
    -out example.com-csr.pem \
    -subj /CN=example.com
openssl req \
    -noout \
    -text \
    -in example.com-csr.pem
openssl x509 -req \
    -sha256 \
    -CA example-ca-crt.pem \
    -CAkey example-ca-key.pem \
    -CAcreateserial \
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
