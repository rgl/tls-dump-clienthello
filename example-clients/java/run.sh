#!/bin/bash
set -euxo pipefail

gradle build --no-daemon --warning-mode all

if [ ! -f jSSLKeyLog.jar ]; then
    wget -q https://github.com/jsslkeylog/jsslkeylog/releases/download/v1.3.0/jSSLKeyLog-1.3.zip
    7z x jSSLKeyLog-1.3.zip jSSLKeyLog.jar
fi

# NB by adding the jsslkeylog java agent all tls session keys
#    will be written to a text file.
# NB search the web for "SSLKEYLOGFILE wireshark" to known how
#    to configure wireshark to use this file as a
#    (Pre)-Master-Secret log filename.
# NB depending on your java distribution version, you might
#    be able to use different TLS versions by setting the
#    jdk.tls.client.protocols system property. for example:
#       -Djdk.tls.client.protocols="TLSv1.3,TLSv1.2"
java \
    -javaagent:jSSLKeyLog.jar=java-key-log.txt \
    -jar build/libs/example-1.0.0-all.jar
