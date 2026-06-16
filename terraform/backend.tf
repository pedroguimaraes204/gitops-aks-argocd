terraform {
  backend "azurerm" {
    resource_group_name = "rg-gitops-dev"
    storage_account_name = "stggitopsdev"
    container_name = "tfstate"
    key = "dev.terraform.tfstate"
  }
}