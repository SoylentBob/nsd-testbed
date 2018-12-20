#!/bin/bash
config_dir=/etc/nsd
config=$config_dir/nsd.conf
inotifywait --monitor --event modify $config |
  while read path _ file; do
    if nsd-checkconf $config; then
       echo "Reloading $config" > /dev/stdout
       nsd-control reconfig
     else
       echo "Could not reload $config, because the config is invalid" > /dev/stderr
     fi
   done
