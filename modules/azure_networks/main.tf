resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnets
  name                = each.value.name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "subnet" {
    for_each = each.value.subnets != null ? each.value.subnets : []
    content {
      name           = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}