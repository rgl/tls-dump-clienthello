#!/bin/bash
set -eux

dotnet --diagnostics build --configuration Release

./bin/Release/netcoreapp3.1/dotnet
