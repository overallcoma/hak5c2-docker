#!/bin/bash

C2_FILE=$(find ./hak5c2/ -type f -name '*amd64_linux')
C2_SWITCHES=()

if [ -z ${C2_HOSTNAME+x} ]
then
    echo "C2_HOSTNAME is a required variable"
    sleep 10
    exit
else
    C2_SWITCHES+=('-hostname')
    C2_SWITCHES+=("$C2_HOSTNAME")
fi

C2_SWITCHES+=('-reverseProxy')
C2_SWITCHES+=('-reverseProxyPort')
C2_SWITCHES+=('4242')
C2_SWITCHES+=('listenport')
C2_SWITCHES+=('8080')
C2_SWITCHES+=('db')
C2_SWITCHES+=('/data/c2.db')

if [ -z ${C2_DEBUG+x} ]
then
    echo "Debug not set"
else
    C2_SWITCHES+=('-debug')
fi

if [ -z ${C2_LICENSE_KEY+x} ]
then
    echo "License Key Not Set"
else
    C2_SWITCHES+=("-setLicenseKey")
    C2_SWITCHES+=($C2_LICENSE_KEY)
fi

for i in "${C2_SWITCHES[@]}"; do
    echo $i
done

SWITCH_STRING="${C2_SWITCHES[@]}"
RUN_COMMAND="$C2_FILE $SWITCH_STRING"
$RUN_COMMAND
