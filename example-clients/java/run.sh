#!/bin/bash
set -eux

gradle clean build

if [ ! -f jSSLKeyLog.jar ]; then
    wget -q https://netcologne.dl.sourceforge.net/project/jsslkeylog/jsslkeylog-1.2/jSSLKeyLog-1.2.zip
    7z x jSSLKeyLog-1.2.zip jSSLKeyLog.jar
fi

# NB by adding the jsslkeylog java agent all tls session keys
#    will be written to a text file.
# NB search the web for "SSLKEYLOGFILE wireshark" to known how
#    to configure wireshark to use this file as a
#    (Pre)-Master-Secret log filename.
java \
    -javaagent:jSSLKeyLog.jar=java-key-log.txt \
    -jar build/libs/example-1.0.0-all.jar
