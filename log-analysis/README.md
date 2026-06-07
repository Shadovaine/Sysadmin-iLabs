# Log Analysis Lab

## Overview

This lab introduces basic Linux log analysis techniques commonly used by system administrators when investigating authentication issues and potential security events.

## Lab Features

- Analyzes SSH authentication logs
- Counts failed login attempts
- Identifies IP addresses
- Displays successful login attempt
- Tracks targeted usernames
- Generates a reusable report file

## Lab Files

| File | Purpose |
|------|---------|
| auth.log | Sample authentication log |
| analyze_logs.sh | Log analysis report |
| log_report.txt | Generated analysis report |

### This lab uses the Podman container environment described in the Sysadmin-iLabs README.md.

**To Run Lab**

```bash
chmod +x analyze_logs.sh
./analyze_logs.sh
```

