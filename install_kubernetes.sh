#!/bin/bash

# Function for highlighted output
highlight() {
    echo -e "\e[1;32m$1\e[0m" # Bold green text
}

# Update and upgrade system packages
highlight "Updating and upgrading system packages..."
sudo apt update && sudo apt upgrade -y

# Install required dependencies
highlight "Installing required dependencies..."
sudo apt install -y curl apt-transport-https conntrack

# Download Minikube binary
highlight "Downloading Minikube binary..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# Install Minikube
highlight "Installing Minikube..."
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Verify Minikube installation
highlight "Verifying Minikube installation..."
minikube version

# Clean up downloaded binary
highlight "Cleaning up..."
rm -f minikube-linux-amd64

highlight "Minikube installation completed successfully!"
