#!/bin/bash
set -euxo pipefail

export NWJS_BUILD_TYPE=sdk

npm ci

# TODO do not ignore the certificate errors.
./node_modules/.bin/nw \
    --ignore-certificate-errors \
    --enable-logging=stderr
