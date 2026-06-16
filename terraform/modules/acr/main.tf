resource "azurerm_container_registry" "acrdevgitops" {
  name                = "acrdevgitops2026"
  resource_group_name = "rg-gitops-dev"
  location            = "eastus"
  sku                 = "Basic"
  admin_enabled       = false
}