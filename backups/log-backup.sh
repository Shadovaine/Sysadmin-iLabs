#!/usr/bin/env bash
#
# log-backup.sh — automated log backup for junior sysadmins
# Reads /etc/log-backup.conf (or env vars) for settings.
# Intended to run inside a Podman container (see Containerfile).

set -euo pipefail

SOURCE="${SOURCE_DIR:-/var/log}"        # what to back up
DEST="${DEST_DIR:-/backup/logs}"        # backup drive mount point (inside container)
KEEP="${KEEP_COUNT:-14}"                # how many snapshots to retain
LOG="${BACKUP_LOG:-/backup/backup.log}" # the backup job's own log

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
TARGET="${DEST}/${TIMESTAMP}"

echo "[$(date)] === Backup started ===" >> "$LOG"
echo "[$(date)] Source: ${SOURCE}"       >> "$LOG"
echo "[$(date)] Target: ${TARGET}"      >> "$LOG"

mkdir -p "$TARGET"

# Find previous snapshot for --link-dest (dedupe: unchanged files stored once)
LAST=$(ls -1d "$DEST"/20*-*-*_*-*-* 2>/dev/null | sort | tail -n 1 || true)

if [[ -n "$LAST" ]]; then
    cp -al "${LAST}/." "${TARGET}/" 2>/dev/null || true
    rsync -a --delete "${SOURCE}/" "${TARGET}/"
else
    rsync -a "${SOURCE}/" "${TARGET}/"
fi

# Prune old snapshots beyond KEEP count
PRUNED=$(ls -1d "$DEST"/20*-*-*_*-*-* 2>/dev/null | sort | head -n -"$KEEP" || true)
for dir in $PRUNED; do
    echo "[$(date)] Pruning old backup: ${dir}" >> "$LOG"
    rm -rf "$dir"
done

COUNT=$(ls -1d "$DEST"/20*-*-*_*-*-* 2>/dev/null | wc -l)
echo "[$(date)] Backup complete. Snapshots retained: ${COUNT}/${KEEP}" >> "$LOG"
echo "[$(date)] === Backup finished ===" >> "$LOG"
