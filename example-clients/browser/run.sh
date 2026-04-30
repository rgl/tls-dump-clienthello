#!/bin/bash
set -euxo pipefail

# install the dependencies.
# NB this will install the required browsers automatically.
#    e.g. at C:\Users\vagrant\AppData\Local\ms-playwright\firefox-1511\firefox\firefox.exe
# see https://playwright.dev/docs/browsers#managing-browser-binaries
npm ci
npx playwright install chromium firefox

# set the node.js certificate trust store.
export SSL_CERT_FILE='../../example-ca-crt.pem'

# execute the example clients.
node --use-openssl-ca main.js
