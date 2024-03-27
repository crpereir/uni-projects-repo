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

### Start elastic search service.
systemctl start elasticsearch

### Read all instances ports in the current configuration.
PORTS=$($TVSAPP_BIN/tvsapp-read-ports.sh)

### Start all web instances services.
for PORT in $PORTS; do
    systemctl start tvsapp@$PORT
done

### Check if the site is already active on nginx ...
TVSAPP_SITES_ENABLED=$(ls "$NGINX_CONF/sites-enabled" | grep tvsapp)

if [ "$TVSAPP_SITES_ENABLED" == "" ]; then
	### ... if no, activate the site in nginx.
	ln -s $NGINX_CONF/sites-available/tvsapp $NGINX_CONF/sites-enabled/tvsapp
fi

### Reload nginx to apply the changes.
systemctl reload nginx
