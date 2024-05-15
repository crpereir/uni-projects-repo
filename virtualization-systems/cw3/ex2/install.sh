#!/bin/bash

### Check admin privileges.
if [ "$(id -u)" -ne 0 ]; then
    echo "BUSTED! You are arrested for not having admin privileges!"
    exit 1
fi

CW3_EX2_LOC=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

cp -r $CW3_EX2_LOC/service /etc/systemd/system

chown root.root /etc/systemd/system/tvsctld.service
chown root.tvsgrp /etc/systemd/system/tvsctld.socket

systemctl daemon-reload

mkdir $CW3_EX2_LOC/out
gcc $CW3_EX2_LOC/tvsctld/src/tvsctld.c -o $CW3_EX2_LOC/out/tvsctld -lsystemd
mv $CW3_EX2_LOC/out/tvsctld /opt/isel/tvs/tvsctld/bin
chown root.root /opt/isel/tvs/tvsctld/bin/tvsctld


### Check if the site is already active on nginx ...
APP_LINE=$(ls -l "$CW3_EX2_LOC" | grep app)

if [ "$APP_LINE" == "" ]; then
	### ... if so, desactivate the site in nginx.
	mkdir $CW3_EX2_LOC/app
fi


gcc $CW3_EX2_LOC/tvsctl/src/tvsctl.c -o $CW3_EX2_LOC/app/tvsctl
chown root.tvsgrp $CW3_EX2_LOC/app/tvsctl
chmod 750 $CW3_EX2_LOC/app/tvsctl

rmdir $CW3_EX2_LOC/out
