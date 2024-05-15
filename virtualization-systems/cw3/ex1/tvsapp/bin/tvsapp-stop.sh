#!/bin/bash

### Check admin privileges.
if [ "$(id -u)" -ne 0 ]; then
	echo "BUSTED! You are arrested for not having admin privileges!"
	exit 1
fi

### Store the location of bash scripts.
TVSAPP_BIN=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

### Store the location of the nginx configuration.
NGINX_CONF=/etc/nginx

### Check if the database [$1] has been requested to stop ...
if [ "$1" == "-db" ]; then
	### ... if so, stop elastic search service.
	systemctl stop elasticsearch
fi

### Read all instances ports in the current configuration.
PORTS=$($TVSAPP_BIN/tvsapp-read-ports.sh)

### Stop all web instances services.
for PORT in $PORTS; do
    systemctl stop tvsapp@$PORT.service
done

### Check if the site is already active on nginx ...
TVSAPP_SITES_ENABLED=$(ls "$NGINX_CONF/sites-enabled" | grep tvsapp)

if [ "$TVSAPP_SITES_ENABLED" != "" ]; then
	### ... if so, desactivate the site in nginx.
	rm $NGINX_CONF/sites-enabled/tvsapp
fi

### Reload nginx to apply the changes.
systemctl reload nginx
