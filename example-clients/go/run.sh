#!/bin/bash
set -euxo pipefail

if [ "$(uname -o)" == "Msys" ]; then
    EXTENSION='.exe'
else
    EXTENSION=''
fi

go build

./go$EXTENSION
