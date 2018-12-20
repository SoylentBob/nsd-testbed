#!/bin/bash
CONFIGDIR=/etc/nsd
CONFIG=$CONFIGDIR/nsd.conf
inotifywait --monitor --event modify $CONFIG |
  while read path _ file; do
    if nsd-checkconf $CONFIG; then
       echo "Reloading $CONFIG" > /dev/stdout
       nsd-control reconfig
     else
       echo "Could not reload $CONFIG, because the config is invalid" > /dev/stderr
     fi
   done
