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
fi

apt-get update
curl -sfL https://get.k3s.io | sh -