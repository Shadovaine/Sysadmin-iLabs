# Containerfile — RHEL UBI Base (Matches your target environment)
FROM registry.access.redhat.com/ubi9/ubi-minimal

# Install necessary tools using dnf/microdnf (RHEL package manager)
RUN microdnf install -y \
    sudo \
    passwd \
    rsync \
    && microdnf clean all

# Set working directory
WORKDIR /labs

# Copy all lab files into the container
COPY . /labs

# Make specific lab scripts executable
# Note: We add log-backup.sh here too so it runs without 'bash' prefix
RUN chmod +x /labs/user-management/lab.sh \
              /labs/permissions/lab.sh \
              /labs/backups/log-backup.sh

# Default entry: Drop into a shell for interactive labs
CMD ["/bin/bash"]
