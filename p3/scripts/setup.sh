#!/bin/bash

set -e

k3d cluster create p3 --port 80:80@loadbalancer --port 443:443@loadbalancer
kubectl create namespace argocd
kubectl create namespace dev
kubectl create -n argocd -f ../confs/install.yaml
kubectl apply -f ../confs/ingress.yaml -n argocd
echo "The password for 'admin' account is :"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo
