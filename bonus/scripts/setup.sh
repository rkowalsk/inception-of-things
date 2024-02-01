#!/bin/bash

set -e

k3d cluster create p3 --port 80:80@loadbalancer --port 443:443@loadbalancer
kubectl create namespace argocd
kubectl create namespace dev
kubectl create namespace gitlab
kubectl create -n argocd -f ../confs/install.yaml
kubectl apply -f ../confs/ingress_argocd.yaml -n argocd
kubectl apply -f ../confs/ingress_dev.yaml -n dev
kubectl apply -f ../confs/ingress_gitlab.yaml -n gitlab
helm install -n gitlab gitlab gitlab/gitlab \
--set global.hosts.https="false" \
--set global.ingress.configureCertmanager=false
# --set global.hosts.domain=gitlab.example.com \
# --set global.hosts.externalIP=127.0.0.1 \
# --set nginx-ingress.enabled=false \
# --set certmanager.install=false \
