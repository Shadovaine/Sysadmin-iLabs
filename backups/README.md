<h1>
  <p align="center">
    <b>Backups Lab</b>
  </p>
</h1>

# Overview

This lab teaches the fundamentals of operational backups on an enterprise Linux system: preparing storage, deploying a backup script, verifying backups work, and — most importantly — proving you can restore from them. You'll back up /var/log to a dedicated backup drive with timestamped, deduplicated snapshots and retention pruning.

## Environment
I choose to set up this lab within a Virtual Machine. My host OS is Fedora Plasma so I stuck with virt-manager. I set up RHEL 9.8 within a VM. Other labs within the Sysadmin-iLabs repo were executed within a container environment, specifically Podman. For this lab, a VM was decided upon by multiple reasons, a few of them being:
- Real blck devices
- Root-owned files with selective permissions
- SELinux interactions between system components

## Lab Procedure

1. Prepare the backup drive

```bash
lsblk -f                      # identify your second disk, e.g. /dev/vdb
sudo mkfs.xfs /dev/vdb        # WARNING: erases the disk
sudo mkdir -p /mnt/backupdrive
echo '/dev/vdb  /mnt/backupdrive  xfs  defaults  0  0' | sudo tee -a /etc/fstab
sudo mount -a
df -h /mnt/backupdrive        # verify it's mounted
```

2. Create the backup destination
```bash
sudo mkdir -p /mnt/backupdrive/logs
```

3. Deploy the script
```bash
udo cp backups/log-backup.sh /usr/local/bin/log-backup.sh
sudo chmod +x /usr/local/bin/log-backup.sh
```

4. Run your first backup
```bash
sudo /usr/local/bin/log-backup.sh
```

5. The Restore Drill - A backup is not successful until it has completed a successful restoration.
```bash
SNAP=$(ls -1t /mnt/backupdrive/logs | head -1)

# Restore to a temporary location and verify integrity:
sudo rsync -a /mnt/backupdrive/logs/$SNAP/ /tmp/restore-test/
diff -r /tmp/restore-test /var/log | head
sudo rm -rf /tmp/restore-test

# Now simulate data loss and recover from your backup:
sudo rm /var/log/dmesg
sudo cp /mnt/backupdrive/logs/$SNAP/dmesg /var/log/dmesg
```
## What this lab does not cover.
- Encryption — production backups should be encrypted at rest (see restic or borg)
- Off-site copies — the 3-2-1 rule (3 copies, 2 media types, 1 off-site)
- Database backups — live databases need dump/consistent-snapshot tooling, not file copies
