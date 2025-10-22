terraform {
  backend "azurerm" {
    resource_group_name  = "rg-landingzone-tfstate"
    storage_account_name = "stlztf2131"
    container_name       = "tfstate"
    key                  = "aks-devops/dev.terraform.tfstate"
    use_azuread_auth     = true
  }
}


