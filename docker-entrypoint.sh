#!/bin/bash

export C2_FILE="$(find /hak5c2 -type f -name '*amd64_linux')"
echo "${C2_FILE}"

export C2_SWITCHES="${C2_SWITCHES} -reverseProxy"

if test -z "$C2_DEBUG"
then
    export C2_SWITCHES="${C2_SWITCHES} -debug"
fi

if test -z "$C2_HOSTNAME"
then
    export C2_SWITCHES="${C2_SWITCHES} -hostname ${C2_HOSTNAME}"
else
    print "C2_HOSTNAME is a required variable"
    sleep 10
    init 0
fi

if test -z "$C2_LICENSE_KEY"
then
    export C2_SWITCHES="${C2_SWITCHES} -setLicenseKey ${C2_LICENSE_KEY}"
fi

cd /hak5c2
/bin/bash "./${C2_FILE} ${C2_SWITCHES}"
