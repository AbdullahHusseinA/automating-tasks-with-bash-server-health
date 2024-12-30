#!/bin/bash
# Script to check network connectivity
LOG_FILE="../logs/network.log"
TARGET="8.8.8.8"  # Google DNS, replace if needed

mkdir -p ../logs

echo "$(date): Checking network connectivity..." >> "$LOG_FILE"

ping -c 4 $TARGET &> /dev/null
if [ $? -ne 0 ]; then
	echo "Warning: Unable to reach $TARGET!" >> "$LOG_FILE"
else
	echo "Network is operational." >> "$LOG_FILE"
fi

echo "Network check complete." >> "$LOG_FILE"
#
