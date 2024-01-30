#!/usr/bin/env bash

echo "Provisioning Server"

apt-get update
apt-get install -y curl
curl -sfL https://get.k3s.io | sh -s - server --flannel-iface eth1
chmod 644 /etc/rancher/k3s/k3s.yaml
kubectl apply -f "/vagrant/confs/"
