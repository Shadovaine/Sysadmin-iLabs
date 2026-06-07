# Interactive SysAdmin Labs

Interactive SysAdmin Labs is a hands-on Linux system administration practice repo.

Instead of only reading documentation, users run guided shell labs that simulate common junior SysAdmin tasks such as user management, permissions, log analysis, backups, and system health checks.

The goal is to practice real admin workflows in a safe, repeatable lab environment. 

## Container Environment

All labs in this repository use the container platform Podman. Each lab is designed to run inside a Podman container.

### To start a Lab Container

**Clone Repo**

```bash
git clone github.com/Shadovaine/Sysadmin-iLabs
```

**Enter repo**

```bash
cd Sysadmin-iLabs
```

**Build lab image**

```bash
podman build -t sysadmin-ilabs .
```

**Start Lab Container**

```bash
podman run -it --rm sysadmin-ilabs
```

## Labs

- [User Management](./user-management)
- [Permissions](./permissions)
- [Log Analysis](./log-analysis)
- [Service Management](./service-management)
- [Backup Automation](./backup-automation)
- [System Health Check](./system-health-check)

## Project Goals

This repo is designed to demonstrate:

- Linux command-line skills
- Bash scripting
- SysAdmin task automation
- Troubleshooting practice
- Clear technical documentation
- Safe lab-based learning

## Labs Available:

- [User Management](./user-management)
- [Permissions](./permissions)
- [Service Management](./service-management)

## Current Status

This project is under active development.
