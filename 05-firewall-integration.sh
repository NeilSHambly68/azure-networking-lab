#!/bin/bash
az network firewall create --name NetLabFirewall --resource-group NetLabRG --location eastus

az network public-ip create --name FirewallPublicIP --resource-group NetLabRG --sku Standard --allocation-method Static

az network firewall policy create --name NetLabPolicy --resource-group NetLabRG

az network firewall policy rule-collection-group create \
  --policy-name NetLabPolicy \
  --resource-group NetLabRG \
  --name AllowWeb \
  --priority 100 \
  --rule-collection-name WebRules \
  --rule-collection-type NetworkRule \
  --rules '[{"name":"AllowHTTP","ruleType":"NetworkRule","ipProtocols":["TCP"],"sourceAddresses":["*"],"destinationAddresses":["*"],"destinationPorts":["80"]}]'
