#!/bin/bash
set -eux

dotnet --diagnostics build --configuration Release

./bin/Release/net48/dotnetframework.exe
