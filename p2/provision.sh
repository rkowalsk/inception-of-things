#!/usr/bin/env bash

echo "Provisioning Server"

apt-get update
apt-get install -y curl
curl -sfL https://get.k3s.io | sh -s - server --flannel-iface eth1
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
kubectl apply -f "/vagrant/deployment/app1.yaml"
#kubectl apply -f "/vagrant/deployment/app2.yaml"
#kubectl apply -f "/vagrant/deployment/app3.yaml"
#kubectl create service clusterip app-one --tcp=80:80
#kubectl create service clusterip app-two --tcp=80:80
#kubectl create service clusterip app-three --tcp=80:80
#kubectl apply -f "/vagrant/deployment/ingress.yaml"