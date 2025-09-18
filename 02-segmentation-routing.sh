#!/bin/bash
az network nsg create --resource-group NetLabRG --name Spoke1NSG

az network nsg rule create \
  --resource-group NetLabRG \
  --nsg-name Spoke1NSG \
  --name DenyInternet \
  --priority 100 \
  --access Deny \
  --direction Outbound \
  --destination-address-prefix Internet \
  --protocol Tcp \
  --source-port-range '*' \
  --destination-port-range '*'

az network route-table create --name Spoke1RouteTable --resource-group NetLabRG

az network route-table route create \
  --resource-group NetLabRG \
  --route-table-name Spoke1RouteTable \
  --name RouteToHub \
  --address-prefix 0.0.0.0/0 \
  --next-hop-type VirtualAppliance \
  --next-hop-ip-address 10.0.0.4
