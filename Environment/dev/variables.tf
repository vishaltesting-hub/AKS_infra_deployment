variable "rg" {
  description = "A map of resource group configurations."
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))

}

variable "vnets" {
  description = "A map of virtual network configurations."
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })))
  }))

}

variable "acr" {
  description = "A map of Azure Container Registry configurations."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool
    tags                = optional(map(string))
  }))

}

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

variable "mssql_databases" {
  description = "A map of Azure MSSQL database configurations."
  type = map(object({
    name             = string
    mssql_server_key = string
    max_size_gb      = number
    sku_name         = optional(string)
  }))
}

variable "mssql_servers" {
  description = "A map of Azure MySQL server configurations."
  type = map(object({
    name                   = string
    resource_group_name    = string
    location               = string
    version                = string
    administrator_login    = string
    administrator_password = string
    tags                   = optional(map(string))
  }))

}
