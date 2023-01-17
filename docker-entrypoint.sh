#!/bin/bash

export C2_FILE="/hak5c2/c2-3.2.0_amd64_linux"
echo "${C2_FILE}"
ls /hak5c2
ls /

export C2_SWITCHES="${C2_SWITCHES} -reverseProxy"

if [ -z ${C2_DEBUG} ]
then
    export C2_SWITCHES="${C2_SWITCHES} -debug"
fi

if [ -z ${$C2_HOSTNAME} ]
then
    export C2_SWITCHES="${C2_SWITCHES} -hostname ${C2_HOSTNAME}"
else
    print "C2_HOSTNAME is a required variable"
    sleep 10
    init 0
fi

if [ -z ${C2_LICENSE_KEY} ]
then
    export C2_SWITCHES="${C2_SWITCHES} -setLicenseKey ${C2_LICENSE_KEY}"
fi

cd /hak5c2
/bin/bash "${C2_FILE} ${C2_SWITCHES}"
tail -f "/dev/null"
