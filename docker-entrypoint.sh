#!/bin/bash

export C2_FILE="$(find /hak5c2/ -name '*amd64_linux')"
export C2_SWITCHES=""

export C2_SWITCHES = "${C2_SWITCHES} -reverseProxy"

if test -z "$C2_DEBUG"
then
    export C2_SWITCHES = "${C2_SWITCHES} -debug"
fi

if test -z "$C2_HOSTNAME"
then
    export C2_SWITCHES = "${C2_SWITCHES} -hostname ${C2_HOSTNAME}"
else
    print "C2_HOSTNAME is a required variable"
    sleep 10
    init 0
fi

if test -z "$C2_LICENSE_KEY"
then
    export C2_SWITCHES = "${C2_SWITCHES} -setLicenseKey ${C2_LICENSE_KEY}
fi

/hak5c2/${C2_FILE} ${C2_SWITCHES}
