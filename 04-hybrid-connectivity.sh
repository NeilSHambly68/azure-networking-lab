#!/bin/bash
az network vnet create --name OnPremVNet --resource-group NetLabRG --address-prefix 192.168.0.0/16

az network vnet subnet create \
  --name GatewaySubnet \
  --resource-group NetLabRG \
  --vnet-name OnPremVNet \
  --address-prefix 192.168.0.0/24

az network public-ip create --name VPNPublicIP --resource-group NetLabRG --allocation-method Dynamic

az network vpn-gateway create \
  --name OnPremVPNGateway \
  --resource-group NetLabRG \
  --vnet OnPremVNet \
  --public-ip-address VPNPublicIP \
  --gateway-type Vpn \
  --vpn-type RouteBased \
  --sku VpnGw1 \
  --no-wait
