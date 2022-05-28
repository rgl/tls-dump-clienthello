#!/bin/bash
set -euxo pipefail

dotnet --diagnostics build --configuration Release

./bin/Release/net48/dotnetframework.exe
