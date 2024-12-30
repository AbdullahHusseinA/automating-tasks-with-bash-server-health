#!/bin/bash
# Script to check disk usage
LOG_FILE="../logs/disk.log"
THRESHOLD=80

# Create the log directory if it doesn't exist
mkdir -p ../logs

echo "$(date): Checking disk usage..." >> "$LOG_FILE"

# Check disk usage percentage for all mounted filesystems
while read -r line; do
	USAGE=$(echo "$line" | awk '{print $5}' | sed 's/%//')
        PARTITION=$(echo "$line" | awk '{print $1}')
	if [ "$USAGE" -ge "$THRESHOLD" ]; then
		echo "Warning: Disk usage on $PARTITION is at $USAGE%!" >> "$LOG_FILE"
	fi

done < <(df -h | grep '^/dev/')

echo "Disk check complete." >> "$LOG_FILE"


