#!/bin/bash

nsd-control-setup -d /home/dns/

nsd-control start

sh /usr/bin/watch-nsd-config &
sh /usr/bin/watch-zonefiles &

tail -f /dev/stdout
