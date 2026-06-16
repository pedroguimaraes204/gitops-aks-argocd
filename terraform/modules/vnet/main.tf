resource "azurerm_network_security_group" "nsg-dev-subnet" {
  name                = "snet-gitops-nsg"
  location            = "eastus"
  resource_group_name = "rg-gitops-dev"
}

resource "azurerm_network_security_group" "nsg-dev-subnet2" {
  name                = "snet2-gitops-nsg"
  location            = "eastus"
  resource_group_name = "rg-gitops-dev"
}

resource "azurerm_virtual_network" "dev-vnet" {
  name                = "dev-gitops-vnet"
  location            = "eastus"
  resource_group_name = "rg-gitops-dev"
  address_space       = ["10.0.0.0/16"]

  subnet {
    name             = "gitops-snet-dev"
    address_prefixes = ["10.0.1.0/24"]
    security_group = azurerm_network_security_group.nsg-dev-subnet.id
  }

  subnet {
    name             = "gitops-sne2-dev"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.nsg-dev-subnet2.id
  }

  tags = {
    environment = "DEV"
  }
}