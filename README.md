<h1>
  <p align="center">
    <b>SysAdmin iLabs</b>
  </p>
</h1>

Interactive SysAdmin Labs is a hands-on Linux system administration practice repo.

Instead of only reading documentation, users run guided shell labs that simulate common junior SysAdmin tasks such as user management, permissions, log analysis, backups, and system health checks.

The goal is to practice real admin workflows in a safe, repeatable lab environment. 



## Git
Git is a distributed version control system that tracks changes to files over time, letting developers record snapshots of their projects and revert to earlier states if needed. Because every collaborator holds a full copy of the repository and its history, work can be done offline and merged later with others' changes. Its branching model allows lightweight, parallel lines of development, which is why it became the industry standard for source code management, powering platforms like GitHub and GitLab.

**Clone Repo**

```bash
git clone github.com/Shadovaine/Sysadmin-iLabs

cd Sysadmin-iLabs
```
## Podman

Podman and Docker are both OCI-compliant containerization tools that share nearly identical command-line interfaces and build from the same Dockerfile/Containerfile ecosystem, so images and workflows generally transfer between them. The key architectural difference is that Docker relies on a long-running daemon that manages all containers, while Podman is daemonless, launching each container as its own process. This makes Podman rootless by default—a major security advantage—whereas Docker's daemon has historically required elevated privileges. Docker remains the broader platform with polished desktop tooling and orchestration options like Swarm, while Podman shines on Linux servers where its native systemd integration and Kubernetes-style pods fit well. In practice, the choice usually comes down to whether you want Docker's mature, all-in-one ecosystem or Podman's leaner, security-first, daemon-free approach.

**Building a lab image**

```bash
podman build -t sysadmin-ilabs .
```

**To Start a Lab Container**

```bash
podman run -it --rm sysadmin-ilabs
```

## SysAdmin-iLabs

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

