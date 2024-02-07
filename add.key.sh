#!/bin/bash
# Purpose: Create the totp secret stored in $dir/$service/.key file
# Author: Duncan Idaho {https://www.duncanidaho.org/} under GPLv3
# --------------------------------------------------------------------------
# Directory that stores encrypted key for each service
dir="$HOME/.2fa"

# Service directory to host the TOTP secret key
printf "%s" "Service name: "
read kdir

# Existing service failsafe
[ -d "${dir}/${kdir}" ] && { echo "Error: $kdir service exists."; exit 1; }

# Enter service directory
cd $dir && mkdir $kdir && cd $kdir

# User input for TOTP string
printf "%s" "TOTP secret: "
read totp

# Create plain text key
echo -n $totp > .key
