#!/bin/bash
set -euxo pipefail

if [ "$(uname -o)" == "Msys" ]; then
    EXTENSION='.exe'
else
    EXTENSION=''
fi

dotnet --diagnostics build --configuration Release

./bin/Release/net6.0/dotnet$EXTENSION
