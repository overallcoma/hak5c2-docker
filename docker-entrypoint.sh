#!/bin/bash

export C2_FILE="/hak5c2/c2-3.2.0_amd64_linux"
echo "${C2_FILE}"
chmod +x "${C2_FILE}"
echo "${C2_FILE}"
echo "${C2_HOSTNAME}"
ls /hak5c2

if [ -z ${C2_HOSTNAME+x} ]
then
    echo "C2_HOSTNAME is a required variable"
    sleep 10
    exit
else
    export C2_SWITCHES="-hostname ${C2_HOSTNAME}"
fi

export C2_SWITCHES="${C2_SWITCHES} -reverseProxy -reverseProxyPort 4242"

if [ -z ${C2_DEBUG+x} ]
then
    echo "Debug not set"
else
    export C2_SWITCHES="${C2_SWITCHES} -debug"
fi

if [ -z ${C2_LICENSE_KEY+x} ]
then
    echo "License Key Not Set"
else
    export C2_SWITCHES="${C2_SWITCHES} -setLicenseKey ${C2_LICENSE_KEY}"
fi

"${C2_FILE}" "${C2_SWITCHES}"
