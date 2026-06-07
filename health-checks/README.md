# Health Checks Lab

## Overview

This lab demonstrates how system administrators collect basic health information from a Linux system. The script gathers uptime, memory usage, disk utilization, and process statistics to create a simple health report.

---

## Lab Features

- Displays system uptime
- Reports memory utilization
- Reports disk usage
- Identifies top CPU-consuming processes
- Identifies top memory-consuming processes
- Generates a reusable report file

---

## Files

| File | Purpose |
|--------|---------|
| health_check.sh | System health report script |
| health_report.txt | Generated report |

---

### This lab uses the Podman container environment described in the Sysadmin-iLabs README.md.

## To Run Lab

```bash
chmod +x health_check.sh
./health_check.sh
