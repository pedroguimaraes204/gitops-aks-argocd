terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "vnet" {
  source = "./modules/vnet"
}

module "aks" {
  source = "./modules/aks"
}

module "acr" {
  source = "./modules/acr"
}