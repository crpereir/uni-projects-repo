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

### Store the last instance port.
LAST_PORT=$($TVSAPP_BIN/tvsapp-read-ports.sh --last)

### Store a template line for a new instance.
SERVER_LINE='    server 127.0.0.1:'

### Store the line accumulator with the last instance and the new ones.
SERVER_LINES=$SERVER_LINE$LAST_PORT';\n'

### Generate and store in the accumulator _DELTA_ instances in consecutive 
###  ports starting at _LAST_PORT_.
COUNT=0
while [ "$COUNT" -lt "$DELTA" ]
do
	PORT=$(($LAST_PORT+$COUNT+1));
	
    ### Start web instance service.
	systemctl start tvsapp@$PORT
	
	SERVER_LINES=$SERVER_LINES$SERVER_LINE$PORT';'
	
	### Check if is the last instance ...
	if [ "$(($COUNT+1))" -ne "$DELTA" ]; then
		### ... if no, puts line terminator.
		SERVER_LINES=$SERVER_LINES'\n';
	fi;
	COUNT=$(($COUNT+1))
done;

### Store the location of current configuration.
TVSAPP_CONF=/etc/nginx/sites-available/tvsapp

### Store the line containing last instance to replace in configuration.
LAST_INSTANCE_LINE=$(cat "$TVSAPP_CONF" | grep ":$LAST_PORT;" | uniq)

### Apply the change to the configuration.
perl -0777 -i -pe "s/$LAST_INSTANCE_LINE/$SERVER_LINES/igs" $TVSAPP_CONF;

### Reload nginx to apply the changes.
systemctl reload nginx
