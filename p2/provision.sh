#!/usr/bin/env bash

echo "Provisioning Server"

apt-get update
apt-get install -y curl
curl -sfL https://get.k3s.io | K3S_TOKEN=amogus sh -s - server --flannel-iface eth1