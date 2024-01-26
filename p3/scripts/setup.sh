#!/bin/bash

set -e

k3d cluster create p3 --port 8080:80@loadbalancer --port 8443:443@loadbalancer
kubectl create namespace argocd
kubectl create -n argocd -f ../confs/install.yaml
kubectl apply -f ../confs/ingress.yaml -n argocd
#kubectl create namespace dev
