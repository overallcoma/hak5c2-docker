#!/bin/bash

C2_FILE="/hak5c2/c2-3.2.0_amd64_linux"
echo "${C2_FILE}"
chmod +x "${C2_FILE}"
echo "${C2_FILE}"
echo "${C2_HOSTNAME}"
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
RUN_COMMAND="${C2_FILE}" $SWITCH_STRING
echo $RUN_COMMAND
$RUN_COMMAND
