#!/bin/bash
az aks create \
  --resource-group NetLabRG \
  --name NetLabAKS \
  --node-count 2 \
  --enable-addons monitoring \
  --network-plugin azure \
  --generate-ssh-keys

az aks get-credentials --resource-group NetLabRG --name NetLabAKS

kubectl get pods -o wide
