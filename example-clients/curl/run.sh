#!/bin/bash
set -euxo pipefail

curl_version="$(curl --version | awk '/^curl / {print $2}')"

export CURL_CA_BUNDLE=../../example.com-crt.pem

curl \
    --get \
    --data-urlencode "example-client=curl/$curl_version" \
    https://example.com:8888
