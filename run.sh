#!/bin/bash

# List of scripts to be executed
SCRIPTS=("content_rule_sshd_set_keepalive.sh")

# Loop through each script
for SCRIPT in "${SCRIPTS[@]}"; do
    echo "Running $SCRIPT with sudo..."
    sudo ./$SCRIPT
    echo "$SCRIPT completed."
done