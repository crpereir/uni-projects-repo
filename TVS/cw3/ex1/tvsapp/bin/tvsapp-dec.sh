#!/bin/bash

### Check admin privileges.
if [ "$(id -u)" -ne 0 ]; then
    echo "BUSTED! You are arrested for not having admin privileges!"
    exit 1
fi

### Store delta.
DELTA=1;

### Check if a delta [$1] has been specified and if it is valid ...
if [[ "$1" =~ [0-9]+ ]]; then
	### ... if so, updates delta.
	DELTA=$1
else
	echo "Delta invalid or not passed - default value used."
fi;

### Displays the delta that will be used.
echo "Delta = $DELTA";

### Store the location of bash scripts.
TVSAPP_BIN=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

### Read all instances ports in the current configuration.
PORTS=$($TVSAPP_BIN/tvsapp-read-ports.sh)

### Store the number of instances ports ...
NUMBER_OF_PORTS=$(echo "$PORTS" | wc -l)

### ... and check if at least one instance remains.
if [ "$DELTA" -ge "$NUMBER_OF_PORTS" ]; then
	echo "There must be at least one instance of service."
	exit 1
fi;	

### Store instance ports to remove.
PORTS_TO_REMOVE=$(echo "$PORTS" | tail -n $DELTA)

### Stop web instances services before remove.
for PORT in $PORTS_TO_REMOVE; do
	systemctl stop tvsapp@$PORT
done

### Store the location of current configuration.
TVSAPP_CONF=/etc/nginx/sites-available/tvsapp

### Generate a temporary file with the current instances.
cat "$TVSAPP_CONF" | grep ":[0-9]\+;" | sort -n | uniq > $TVSAPP_BIN/tvsapp

### Store all current instances.
ALL_INSTANCES=$(cat $TVSAPP_BIN/tvsapp)

### Store remaining instances.
NUMBER_OF_REMAINING_PORTS=$(($NUMBER_OF_PORTS-$DELTA))
REMAINING_INSTANCES=$(cat $TVSAPP_BIN/tvsapp | head -n $NUMBER_OF_REMAINING_PORTS)

### Apply the change to the configuration.
perl -0777 -i -pe "s/$ALL_INSTANCES/$REMAINING_INSTANCES/igs" $TVSAPP_CONF;

### Remove the temporary file.
rm $TVSAPP_BIN/tvsapp

### Reload nginx to apply the changes.
systemctl reload nginx
