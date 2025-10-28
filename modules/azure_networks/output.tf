
output "virtual_network_ids" {
  description = "The IDs of the created virtual networks."
  value       = { for vnet_key, vnet in azurerm_virtual_network.vnet : vnet_key => vnet.id }
}
output "subnet_ids" {
  description = "The IDs of the created subnets."
  value = {
    for vnet_key, vnet in azurerm_virtual_network.vnet :
    vnet_key => {
      for subnet in vnet.subnet : subnet.name => subnet.id
    }
  }
}