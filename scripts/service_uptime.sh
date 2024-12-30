#!/bin/bash
# Script to check service uptime
LOG_FILE="../logs/uptime.log"
SERVICES=("ssh" "cron")  # Add or replace with the services you want to monitor

mkdir -p ../logs

echo "$(date): Checking service uptime..." >> "$LOG_FILE"

for SERVICE in "${SERVICES[@]}"; do
	systemctl is-active --quiet "$SERVICE"
	if [ $? -ne 0 ]; then
		echo "Warning: $SERVICE service is not running!" >> "$LOG_FILE"
	else
		echo "$SERVICE service is operational." >> "$LOG_FILE"
	fi
done

echo "Service uptime check complete." >> "$LOG_FILE"
#                                
