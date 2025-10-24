terraform {
  backend "azurerm" {
    resource_group_name   = "tfstate-rg"
    storage_account_name  = "tstatea922adfd"
    container_name        = "tfstate"
    key                   = "dev.terraform.tfstate"
  }
}

