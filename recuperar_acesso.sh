#!/bin/bash
set -e

echo "Iniciando recuperação de acesso remoto..."

# Remover o openssh-server
apt purge --auto-remove openssh-server -y

# Instalar o openssh-server novamente
apt install openssh-server -y

# Reiniciar o serviço SSH
systemctl restart ssh

# Baixar nova configuração do SSH
wget -qO /etc/ssh/sshd_config https://n9.cl/theromshost-sshd

# Reiniciar o serviço SSH
service ssh restart

# Solicitar nova senha root
echo "Por favor, insira a nova senha para o usuário root:"
passwd root

# Atualizar o sistema
apt update && apt upgrade -y

echo "Recuperação concluída com sucesso!"