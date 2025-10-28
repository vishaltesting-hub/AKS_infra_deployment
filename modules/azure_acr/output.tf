output "acr_ids" {
  description = "The IDs of the created Azure Container Registries."
  value       = { for acr_key, acr in azurerm_container_registry.acr : acr_key => acr.id }
}