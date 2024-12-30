#!/bin/bash
# Script to check CPU usage
LOG_FILE="../logs/cpu.log"
THRESHOLD=85  # CPU usage threshold percentage

mkdir -p ../logs

echo "$(date): Checking CPU usage..." >> "$LOG_FILE"

CPU_USAGE=$(mpstat 1 1 | awk '/Average/ {print 100 - $NF}')
echo "CPU Usage: $CPU_USAGE%" >> "$LOG_FILE"

if (( $(echo "$CPU_USAGE >= $THRESHOLD" | bc -l) )); then
	echo "Warning: CPU usage is at $CPU_USAGE%!" >> "$LOG_FILE"
fi

echo "CPU check complete." >> "$LOG_FILE"

