#!/bin/bash

echo "The password for 'admin' account is :"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo
