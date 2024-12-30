#!/bin/bash
# Script to check memory usage
LOG_FILE="../logs/memory.log"
THRESHOLD=20  # Low memory threshold percentage

mkdir -p ../logs

echo "$(date): Checking memory usage..." >> "$LOG_FILE"

MEMORY_AVAILABLE=$(free -m | grep 'Mem:' | awk '{printf "%.0f", $7/$2 * 100}')

echo "Available memory: $MEMORY_AVAILABLE%" >> "$LOG_FILE"

if [ "$MEMORY_AVAILABLE" -le "$THRESHOLD" ]; then
	echo "Warning: Available memory is below $THRESHOLD%!" >> "$LOG_FILE"
fi

echo "Memory check complete." >> "$LOG_FILE"
#
