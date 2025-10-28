resource "azurerm_kubernetes_cluster" "aks_cluster" {
  for_each            = var.aks_clusters
  name                = each.value.cluster_name
  location            = each.value.cluster_location
  resource_group_name = each.value.rg_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.default_node_pool.name
    node_count = each.value.default_node_pool.node_count
    vm_size    = each.value.default_node_pool.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = each.value.tags
}
