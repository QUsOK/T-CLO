#!/bin/bash
set -e

# -----------------------------
# Installer SSH et sudo
# -----------------------------
apt-get update -y
apt-get install -y openssh-server sudo

# -----------------------------
# Démarrer et activer le service SSH
# -----------------------------
systemctl enable ssh
systemctl start ssh

# -----------------------------
# Ajouter l'utilisateur admin avec clé SSH
# -----------------------------
useradd -m -s /bin/bash azureuser || true
mkdir -p /home/azureuser/.ssh
echo "${ssh_public_key}" > /home/azureuser/.ssh/authorized_keys
chmod 700 /home/azureuser/.ssh
chmod 600 /home/azureuser/.ssh/authorized_keys
chown -R azureuser:azureuser /home/azureuser/.ssh
