# Set log and output file paths
LOG_DIR="../logs"
REPORT_FILE="../logs/summary_report.log"

# Add timestamp to the start of the report
echo "$(date): Generating server health summary report..." > "$REPORT_FILE"

# Check if logs directory exists and if there are log files to report on
if [ ! -d "$LOG_DIR" ]; then
	echo "Error: Logs directory does not exist." >> "$REPORT_FILE"
	exit 1
fi

# Check for log files in the directory
LOG_FILES=$(ls $LOG_DIR/*.log 2>/dev/null)
if [ -z "$LOG_FILES" ]; then
	echo "Error: No log files found in $LOG_DIR." >> "$REPORT_FILE"
	exit 1
fi

# Check each log file and append information to the report
for log in $LOG_DIR/*.log; do
	echo "----- $(basename $log) -----" >> "$REPORT_FILE"
	cat "$log" >> "$REPORT_FILE"
	echo "" >> "$REPORT_FILE"
done

echo "Server health summary report generated." >> "$REPORT_FILE"

