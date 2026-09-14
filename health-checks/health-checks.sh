#!/bin/bash

REPORT="health_report.txt"

{
echo "=====System Health Report====="
echo "Generated: $(date)"
echo

echo
echo "========================"
echo " Uptime"
echo "========================"
uptime
echo

echo
echo "========================"
echo " Memory Usage"
echo "========================"
free -h
echo

echo
echo "========================"
echo " Disk Usage"
echo "========================"
df -h
echo

echo
echo "========================="
echo " Health Warnings"
echo "========================="

MEMORY_USED=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')

if [ "$MEMORY_USED" -ge 80 ]; then
    echo "WARNING: Memory Usage is ($MEMORY_USED)%"
else
    echo "OK: Memory Usage is ($MEMORY_USED)%"
fi

echo

df -h
do
    USAGE_NUM=$(echo "$usage" | tr -d '%')

    if [ "$USAGE_NUM" -ge 80 ]; then
	echo "WARNING: $mount is ($USAGE_NUM}% full"
    else
	echo "OK: $mount is ($USAGE_NUM)% full"
    fi
done

echo

echo
echo "======================================="
echo " Top 5 Memory Consuming Process"
echo "======================================="
echo
ps aux --sort=-%mem | head -6
echo

echo
echo "======================================="
echo " Top 5 CPU Consuming Process"
echo "======================================="
echo
ps aux --sort=-%cpu | head -6
echo

} | tee "$REPORT"


echo
echo "Report saved to $REPORT"
