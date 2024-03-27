#!/bin/bash

### Check admin privileges.
if [ "$(id -u)" -ne 0 ]; then
    echo "BUSTED! You are arrested for not having admin privileges!"
    exit 1
fi

### Store scale and base.
SCALE=1;
BASE=39000;

### Check if a scale [$1] has been specified and if it is valid ...
if [[ "$1" =~ [0-9]+ ]]; then
	if [ "$1" -ne 0 ]; then
		### ... if so, updates scale.
		SCALE=$1
	else 
		echo "Scale invalid or not passed - default value used."
	fi;
else
	echo "Scale invalid or not passed - default value used."
fi;

### Check if a base [$2] has been specified and if it is valid ...
if [[ "$2" =~ [0-9]+ ]]; then
	if [ "$2" -ne 0 ]; then
		### ... if so, updates base.
		BASE=$2
	else 
		echo "Base invalid or not passed - default value used."
	fi;
else
	echo "Base invalid or not passed - default value used."
fi;

### Displays the scale and base that will be used.
echo "Scale = $SCALE";
echo "Base = $BASE";

### Store the location of bash scripts.
TVSAPP_BIN=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

### Store the location of the nginx configuration.
NGINX_CONF=/etc/nginx

### Check if the site is already active on nginx ...
TVSAPP_SITES_ENABLED=$(ls "$NGINX_CONF/sites-enabled" | grep tvsapp)

if [ "$TVSAPP_SITES_ENABLED" != "" ]; then
	### ... if so, force an initial stopped configuration.
	$TVSAPP_BIN/tvsapp-stop.sh
fi

### Generate a temporary file with the template of configuration.
$TVSAPP_BIN/tvsapp-generate-config.sh > $TVSAPP_BIN/tvsapp

### Store the text to replace in the template.
REPLACE=$(cat "$TVSAPP_BIN/tvsapp" | grep "#add-text-here")

### Store a template line for a new instance.
SERVER_LINE='    server 127.0.0.1:'

### Store the line accumulator with the new instances.
SERVER_LINES=''

### Generate and store in the accumulator _SCALE_ instances in consecutive 
###  ports starting at _BASE_.
COUNT=0;
while [ "$COUNT" -lt "$SCALE" ]; do
	PORT=$(($BASE+$COUNT))
	SERVER_LINES=$SERVER_LINES$SERVER_LINE$PORT';'
	
	### Check if is the last instance ...
	if [ "$(($COUNT+1))" -ne "$SCALE" ]; then
		### ... if no, puts line terminator.
		SERVER_LINES=$SERVER_LINES'\n'
	fi
	
	COUNT=$(($COUNT+1))
done

### Apply the change to the configuration.
perl -0777 -i -pe "s/$REPLACE/$SERVER_LINES/igs" $TVSAPP_BIN/tvsapp

### Creates or replaces the current configuration.
cp $TVSAPP_BIN/tvsapp $NGINX_CONF/sites-available/tvsapp

### Remove the temporary file.
rm $TVSAPP_BIN/tvsapp
