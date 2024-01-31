#!/bin/bash

set -e

k3d cluster create p3 --port 80:80@loadbalancer --port 443:443@loadbalancer
kubectl create namespace argocd
kubectl create namespace dev
kubectl create namespace gitlab
kubectl create -n argocd -f ../confs/install.yaml
kubectl apply -f ../confs/ingress_argocd.yaml -n argocd
kubectl apply -f ../confs/ingress_dev.yaml -n dev
helm install -n gitlab gitlab gitlab/gitlab --set certmanager-issuer.email=me@example.com \
--set global.hosts.domain=localhost \
--set global.hosts.externalIP=127.0.0.1
