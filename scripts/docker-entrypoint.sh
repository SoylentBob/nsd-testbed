#/bin/bash

nsd-control-setup -d /home/dns/

nsd-control start

watch-nsd-config &
watch-zonefiles &

tail -f /dev/stdout
