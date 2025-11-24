rg = {
  rg1 = {
    name     = "dev-aks-rg1"
    location = "centralindia"
    tags = {
      environment = "dev"
      project     = "aks-infra"
    }
  }
}

vnets = {
  vnet1 = {
    name                = "dev-aks-vnet1"
    address_space       = ["10.0.0.0/16"]
    location            = "centralindia"
    resource_group_name = "dev-aks-rg1"
    tags = {
      environment = "dev"
      project     = "aks-infra"
    }
    subnets = [
      {
        name             = "dev-aks-subnet1"
        address_prefixes = ["10.0.1.0/24"]
      },

      {
        name             = "dev-aks-subnet2"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

acr = {
  acr1 = {
    name                = "devaksacr1"
    resource_group_name = "dev-aks-rg1"
    location            = "centralindia"
    sku                 = "Basic"
    admin_enabled       = true
    tags = {
      environment = "dev"
      project     = "aks-infra"
    }
  }
}

aks_clusters = {
  aks1 = {
    cluster_name     = "dev-aks-cluster1"
    cluster_location = "centralindia"
    rg_name          = "dev-aks-rg1"
    dns_prefix       = "devakscluster1"
    tags = {
      environment = "dev"
      project     = "aks-infra"
    }
    default_node_pool = {
      name       = "agentpool"
      node_count = 2
      vm_size    = "standard_d2s_v5"
    }
  }
}

mssql_databases = {
  mssqldb1 = {
    name             = "dev-mssql-db1"
    mssql_server_key = "mssqlserver1" # key from mssql_servers map
    max_size_gb      = 2
    sku_name         = "Basic"
  }
}

mssql_servers = {
  mssqlserver1 = {
    name                   = "dev-mssql-server1"
    resource_group_name    = "dev-aks-rg1"
    location               = "centralindia"
    version                = "12.0"
    administrator_login    = "sqladminuser"
    administrator_password = "P@ssw0rd1234"
    tags = {
      environment = "dev"
      project     = "aks-infra"
    }
  }
}

