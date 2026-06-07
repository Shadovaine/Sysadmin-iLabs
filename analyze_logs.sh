#!/bin/bash

LOG_FILE="auth.log"
REPORT_FILE="log_report.txt"

clear

echo "Analyzing logs..."

{
echo
echo "======================"
echo " Log Analysis Report"
echo "Generated on: $(date)"
echo "======================"
echo

echo "Total failed login attempts."
grep -c "Failed password" "$LOG_FILE"

echo
echo "Failed login source IPs"
grep "Failed password" "$LOG_FILE" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr

echo
echo "Successful Login"
grep "Accepted password" "$LOG_FILE"

echo
echo "Most targeted usernames:"
grep "Failed password" "$LOG_FILE" | awk '
/invalid user/ {print $(NF-5)}
!/invalid user/ {print $(NF-5)}
' | sort |uniq -c |sort -nr

} | tee "$REPORT_FILE"

echo
echo "Report saved: $REPORT_FILE"
