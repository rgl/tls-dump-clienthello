#!/bin/bash
set -euxo pipefail

bin="$PWD/target/release/tls-dump-clienthello-rust-example-client.exe"
dumpbin="$(realpath /C/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2019/BuildTools/VC/Tools/MSVC/*/bin/Hostx64/x64/dumpbin.exe)"

# build.
cargo build --release

# show the native dependencies.
"$dumpbin" -dependents "$bin"

# run.
"$bin"
