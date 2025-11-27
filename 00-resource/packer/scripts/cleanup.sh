#!/bin/bash
set -eux
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf /tmp/*
echo "[INFO] Image cleaned up."
