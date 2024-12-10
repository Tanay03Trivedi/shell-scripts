#!/bin/bash

# Script to install Docker and Docker Compose on Ubuntu

# Define a function for highlighted output
highlight() {
    echo -e "\e[1;34m$1\e[0m" # Bold blue text
}

# Update and upgrade packages
highlight "Updating and upgrading system packages..."
sudo apt update && sudo apt upgrade -y

# Install required dependencies
highlight "Installing required dependencies..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker GPG key
highlight "Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
highlight "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list to include Docker packages
highlight "Updating package list to include Docker packages..."
sudo apt update

# Install Docker packages
highlight "Installing Docker packages..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Enable Docker service
highlight "Enabling Docker service..."
sudo systemctl enable docker

# Add the current user to the Docker group
highlight "Adding current user to Docker group..."
sudo usermod -aG docker $USER

# Adjust permissions for Docker socket
highlight "Adjusting permissions for Docker socket..."
sudo chmod 666 /var/run/docker.sock

# Install Docker Compose
DOCKER_COMPOSE_VERSION="v2.20.2"
highlight "Installing Docker Compose version $DOCKER_COMPOSE_VERSION..."
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Confirm installation
highlight "Docker and Docker Compose installation completed."
docker --version
docker-compose --version
    
