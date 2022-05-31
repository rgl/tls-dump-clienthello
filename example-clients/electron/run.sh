#!/bin/bash
set -euxo pipefail

npm ci

./node_modules/.bin/electron .
