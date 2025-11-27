#!/bin/bash
set -eux

echo "[INFO] Updating system..."
sudo apt-get update -y
sudo apt-get install -y nginx

# Tùy chỉnh Nginx
sudo systemctl enable nginx
sudo systemctl stop nginx

echo "[INFO] Nginx installed successfully!"
