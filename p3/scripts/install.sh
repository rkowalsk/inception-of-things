#!/bin/sh

set -e
sudo apt-get update && sudo apt-get install -y docker.io
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
sudo curl -L -o /usr/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo chmod +x /usr/bin/kubectl
