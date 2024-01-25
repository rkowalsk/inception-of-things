#!/bin/sh

sudo apt-get autoremove -y docker.io
sudo rm -f $(which k3d)
sudo rm -f $(which kubectl)
