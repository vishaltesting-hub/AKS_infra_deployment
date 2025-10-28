output "kubernetes_cluster_ids" {
  value = {
    for k, v in azurerm_kubernetes_cluster.aks_cluster : k => v.id
  }
}

output "kube_configs" {
  value = {
    for k, v in azurerm_kubernetes_cluster.aks_cluster : k => v.kube_config_raw
  }
}
