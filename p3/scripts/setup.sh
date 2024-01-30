#!/bin/bash

set -e

k3d cluster create p3 --port 80:80@loadbalancer --port 443:443@loadbalancer
kubectl create namespace argocd
kubectl create namespace dev
kubectl create -n argocd -f ../confs/install.yaml
kubectl apply -f ../confs/ingress_argocd.yaml -n argocd
kubectl apply -f ../confs/ingress_dev.yaml -n dev
