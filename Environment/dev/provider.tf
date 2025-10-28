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
  # Configuration options
  features {}
  subscription_id = "b654dee9-19f3-4d87-b356-568e22f79a25"
}