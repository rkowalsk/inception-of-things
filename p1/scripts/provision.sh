#!/usr/bin/env bash

if [ "$#" -eq 0 ]; then
	echo "Give me an argument you dumb fuck"
	exit 1
fi

if [ "$1" == "S" ]; then
	echo "Provisioning Server"
elif [ "$1" == "SW" ]; then
	echo "Provisionning Server Worker"
else
	echo "S or SW you twat"
	exit 1
fi

apt-get update
apt-get install -y curl

if [ "$1" == "S" ]; then
	curl -sfL https://get.k3s.io | K3S_TOKEN=amogus sh -s - server --flannel-iface eth1
elif [ "$1" == "SW" ]; then
	curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=amogus sh -s - --flannel-iface eth1
fi