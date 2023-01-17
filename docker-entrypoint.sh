#!/bin/bash

export C2_FILE="/hak5c2/c2-3.2.0_amd64_linux"
echo "${C2_FILE}"
echo "${C2_HOSTNAME}"
ls /hak5c2

export C2_SWITCHES="-reverseProxy"

if [ -z ${C2_DEBUG+x} ]
then
    export C2_SWITCHES="${C2_SWITCHES} -debug"
fi

if [ -z ${C2_HOSTNAME+x} ]
then
    export C2_SWITCHES="${C2_SWITCHES} -hostname ${C2_HOSTNAME}"
else
    echo "C2_HOSTNAME is a required variable"
    sleep 10
    init 0
fi

if [ -z ${C2_LICENSE_KEY+x} ]
then
    export C2_SWITCHES="${C2_SWITCHES} -setLicenseKey ${C2_LICENSE_KEY}"
fi

cd /hak5c2
/bin/bash "${C2_FILE} ${C2_SWITCHES}"
