#!/bin/bash

### Check admin privileges.
if [ "$(id -u)" -ne 0 ]; then
    echo "BUSTED! You are arrested for not having admin privileges!"
    exit 1
fi

CW3_EX1_LOC=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

cp -r $CW3_EX1_LOC/tvsapp/bin /opt/isel/tvs/tvsapp

chown root.root /opt/isel/tvs/tvsapp/bin/*.sh
