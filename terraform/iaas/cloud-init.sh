#!/bin/bash
set -e

# -----------------------------
# Installer les prérequis
# -----------------------------
apt-get update -y
apt-get install -y curl tar git jq ansible sudo

# -----------------------------
# Créer l'utilisateur runner
# -----------------------------
useradd -m -s /bin/bash github || true
cd /home/github
sudo -u github mkdir -p actions-runner && cd actions-runner

# -----------------------------
# Installer le runner GitHub
# -----------------------------
RUNNER_VERSION="2.320.0"
curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L \
  https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
rm actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# -----------------------------
# Configurer le runner avec variables Terraform
# -----------------------------
sudo -u github ./config.sh \
  --url https://github.com/${GITHUB_ORG}/${GITHUB_REPO} \
  --token ${RUNNER_TOKEN} \
  --name self-hosted-ubuntu \
  --labels self-hosted,linux,x64 \
  --unattended

# -----------------------------
# Installer le runner comme service systemd
# -----------------------------
./svc.sh install github
./svc.sh start

echo "✅ Runner GitHub self-hosted installé et démarré !"
