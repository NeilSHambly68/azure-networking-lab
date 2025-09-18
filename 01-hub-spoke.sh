
---

## 📁 `scripts/`

### `01-hub-spoke.sh`

```bash
#!/bin/bash
az group create --name NetLabRG --location eastus

az network vnet create \
  --name HubVNet \
  --resource-group NetLabRG \
  --address-prefix 10.0.0.0/16 \
  --subnet-name GatewaySubnet \
  --subnet-prefix 10.0.0.0/24

az network vnet create --name Spoke1VNet --resource-group NetLabRG --address-prefix 10.1.0.0/16
az network vnet create --name Spoke2VNet --resource-group NetLabRG --address-prefix 10.2.0.0/16

az network vnet peering create \
  --name Spoke1ToHub \
  --resource-group NetLabRG \
  --vnet-name Spoke1VNet \
  --remote-vnet HubVNet \
  --allow-vnet-access

az network vnet peering create \
  --name Spoke2ToHub \
  --resource-group NetLabRG \
  --vnet-name Spoke2VNet \
  --remote-vnet HubVNet \
  --allow-vnet-access
