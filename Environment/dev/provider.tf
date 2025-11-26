terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name = "tfstate-rg"
  #   storage_account_name = "tfstatestorage231928"
  #   container_name       = "dev_tfstate"
  #   key                  = "aks-infra-dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  
  features {}
  subscription_id = "6dbc33a2-5da4-4090-8ac2-b8dde7d2a834"
}