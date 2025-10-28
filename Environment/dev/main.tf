module "aks_rg" {
  source = "../../modules/azure_rg"
  rg     = var.rg

}

module "azure_networks" {
  source     = "../../modules/azure_networks"
  vnets      = var.vnets
  depends_on = [module.aks_rg]
}

module "acr" {
  source     = "../../modules/azure_acr"
  acr        = var.acr
  depends_on = [module.aks_rg]

}

module "aks_clusters" {
  source       = "../../modules/azure_aks"
  aks_clusters = var.aks_clusters
  depends_on   = [module.azure_networks, module.acr]
}

module "mssql_servers" {
  source        = "../../modules/azure_mssql_server"
  mssql_servers = var.mssql_servers
  depends_on    = [module.aks_rg]

}

module "mssql_databases" {
  source           = "../../modules/azure_mssql_db"
  mssql_databases  = var.mssql_databases
  mssql_server_ids = module.mssql_servers.mssql_server_ids
  depends_on       = [module.mssql_servers]
}
