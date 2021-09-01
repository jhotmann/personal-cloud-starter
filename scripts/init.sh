#!/bin/bash
set -e

# Elevate permissions
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

# Install Prerequisites
apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common build-essential

# Add docker repository (this is for Ubuntu 20.04)
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-get update

# Install docker
apt-get install -y docker-ce

# Add current user to docker group
usermod -aG docker ${USER}

# Download latest compose release
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Start all services
docker-compose up -d
