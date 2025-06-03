#!/bin/bash

# Atualizar o Sistema
sudo apt update
sudo apt upgrade -y

# Instalar pré-requisitos para o Docker
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Adicionar a chave GPG oficial do Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Configurar o repositório do Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualizar o índice de pacotes apt novamente
sudo apt update

# Instalar o Docker Engine
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Adicionar o utilizador atual ao grupo docker (útil quando aceder via SSH à instância)
sudo usermod -aG docker ubuntu

# Iniciar o serviço do Docker
sudo systemctl start docker
sudo systemctl enable docker

# Verificar a instalação do Docker
sudo docker --version

echo "Instalação do Docker concluída."


docker run -p 8080:80 --name servidor-web-01 -d nginx
