#!/bin/bash
set -euxo pipefail

# build.
rebar3 as prod release

# patch the start command.
# NB to be able to run the application has a regular cli appliaction patch the
#    generated boot script to use erl.exe instead of werl.exe.
# see https://github.com/erlang/rebar3/issues/2026
# see https://github.com/rgl/logstash-windows-vagrant/commit/a3975307514862af734558846b5ac1296b8cbf5f
sed -i -E 's,werl\.exe,erl.exe,g' _build/prod/rel/example/bin/example.cmd
sed -i -E 's,@?start "%rel_name% console" %werl%,%werl%,g' _build/prod/rel/example/bin/example.cmd

# run.
./_build/prod/rel/example/bin/example.cmd console
