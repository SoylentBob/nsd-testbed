#!/bin/bash
ZONEFILESDIR=/etc/nsd/zonefiles/
inotifywait --monitor --recursive --event modify $ZONEFILESDIR |
  while read path _ zone; do
    if nsd-checkzone $zone $ZONEFILESDIR$zone; then
      echo "Reloading zone $zone" > /dev/stdout
      nsd-control reload $zone
    else
      echo "Could not reload zone $zone, because the zonefile is invalid" > /dev/stderr
    fi
  done
