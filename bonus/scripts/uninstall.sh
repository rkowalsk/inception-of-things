#!/bin/sh

k3d cluster delete --all
sudo apt-get autoremove -y docker.io
helm uninstall gitlab
sudo rm -f $(which k3d)
sudo rm -f $(which kubectl)
sudo rm -f $(which argocd)
sudo rm -rf $(which helm) $HOME/.cache/helm $HOME/.config/helm $HOME/.local/share/helm
