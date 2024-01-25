#!/bin/sh

k3d cluster delete --all
sudo apt-get autoremove -y docker.io
sudo rm -f $(which k3d)
sudo rm -f $(which kubectl)
sudo rm -f $(which argocd)
