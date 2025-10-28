resource "azurerm_resource_group" "aks_rg" {
  for_each = var.rg
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags

}
