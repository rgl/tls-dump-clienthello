#!/bin/bash
set -euxo pipefail

npm ci

export SSL_CERT_FILE='../../example.com-crt.pem'

node --use-openssl-ca main.js
