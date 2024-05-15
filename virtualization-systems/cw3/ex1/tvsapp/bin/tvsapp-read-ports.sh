#!/bin/bash

### Check admin privileges.
if [ "$(id -u)" -ne 0 ]; then
	echo "BUSTED! You are arrested for not having admin privileges!"
	exit 1
fi

### Store the location of current configuration.
TVSAPP_CONF=/etc/nginx/sites-available/tvsapp

### Store the ports of all instances in the current configuration.
PORTS=$(cat "$TVSAPP_CONF" | grep ":[0-9]\+;" | cut -d ":" -f 2 | cut -d ";" -f 1 | sort -n | uniq)

### Check if the last [$1] has been requested ...
if [ "$1" == "--last" ]; then
   ### ... if so, display the last port.
   echo "$PORTS" | tail -n 1
   exit 0
fi

### Display the stored ports.
echo "$PORTS"
