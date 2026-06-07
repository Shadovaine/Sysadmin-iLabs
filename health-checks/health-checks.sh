#!/bin/bash

REPORT="health_report.txt"

{
echo "=====System Health Report====="
echo "Generated: $(date)"
echo

echo "===== Uptime ====="
uptime
echo

echo "===== Memory Usage ====="
free -h
echo

echo "===== Dish Usage ====="
df -h
echo

echo "===== Top 5 Memory Consuming Processes ====="
ps aux --sort=-%mem | head -6
echo

echo "===== Top 5 CPU Consuming Process ====="
ps aux --sort=-%cpu | head -6
echo

} | tee "$REPORT"

echo
echo "Report saved to $REPORT"
