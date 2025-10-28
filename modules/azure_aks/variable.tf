variable "aks_clusters" {
  description = "A map of AKS cluster configurations."
  type = map(object({
    cluster_name     = string
    cluster_location = string
    rg_name          = string
    dns_prefix       = string
    tags             = map(string)
    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })
  }))
}

