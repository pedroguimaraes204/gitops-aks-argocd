resource "azurerm_kubernetes_cluster" "aks-cluster-dev" {
  name                = "dev-aks1"
  location            = "eastus"
  resource_group_name = "rg-gitops-dev"
  dns_prefix          = "gitops-aks-dev"
  role_based_access_control_enabled = true
  oidc_issuer_enabled = true

  default_node_pool {
    name       = "devpool"
    node_count = 2
    vm_size    = "Standard_D2s_v7"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "DEV"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks-cluster-dev.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks-cluster-dev.kube_config_raw

  sensitive = true
}