#!/bin/bash

nsd-control-setup -d /home/nsd/

nsd-control start

sh /usr/bin/watch-nsd-config &
sh /usr/bin/watch-zonefiles &

tail -f /dev/stdout
