#!/bin/bash

### Check admin privileges.
if [ "$(id -u)" -ne 0 ]; then
	echo "BUSTED! You are arrested for not having admin privileges!"
	exit 1
fi

### Check database state.
DATABASE_STATE=$(systemctl show -P ActiveState elasticsearch)
echo "ElasticSearch: $DATABASE_STATE"

### Store the location of the nginx configuration.
NGINX_CONF=/etc/nginx

### Check if the site is already active on nginx.
TVSAPP_SITES_ENABLED=$(ls "$NGINX_CONF/sites-enabled" | grep tvsapp)
if [ "$TVSAPP_SITES_ENABLED" == "" ]; then
	echo "nginx: inactive"
else 
	echo "nginx: active"
fi

### Store the location of bash scripts.
TVSAPP_BIN=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

### Read all instances ports in the current configuration.
PORTS=$($TVSAPP_BIN/tvsapp-read-ports.sh)

### Check all nodes state.
for PORT in $PORTS; do
	### Check node state.
    INSTANCE_STATE=$(systemctl show -P ActiveState tvsapp@$PORT)
    echo "Node $PORT: $INSTANCE_STATE"
done
