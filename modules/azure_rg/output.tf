
output "resource_group_ids" {
  description = "The IDs of the created resource groups."
  value       = { for rg_key, rg in azurerm_resource_group.aks_rg : rg_key => rg.id }
}