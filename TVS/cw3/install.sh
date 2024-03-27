#!/bin/bash

### Check admin privileges.
if [ "$(id -u)" -ne 0 ]; then
    echo "BUSTED! You are arrested for not having admin privileges!"
    exit 1
fi

CW3_LOC=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

$CW3_LOC/ex1/install.sh

$CW3_LOC/ex2/install.sh
