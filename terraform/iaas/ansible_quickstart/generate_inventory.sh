#!/bin/bash

# Aller chercher l'IP dans terraform/iaas
IP=$(cd ../terraform/iaas && terraform output -raw vm_public_ip 2>/dev/null)

# Si l'IP est vide → erreur
if [ -z "$IP" ]; then
  echo "❌ Impossible de récupérer l'IP — vérifie que tu as bien fait 'terraform apply' dans terraform/iaas"
  exit 1
fi

# Écrit l'inventory Ansible
cat > inventory.ini <<EOF
[webservers]
vm ansible_host=$IP ansible_user=azureuser ansible_ssh_private_key_file=~/.ssh/id_rsa
EOF

echo "✅ Inventory généré avec IP : $IP"
