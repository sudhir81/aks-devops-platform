terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.88.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}

  # ✅ Explicit credentials to fix the "subscription ID could not be determined" error
  subscription_id = "1c95c3eb-55ac-4d47-bee1-e823c941e413"
  tenant_id       = "ffec9195-19f9-4d30-93a0-48d445d9ed13"

  # Use the currently logged-in Azure CLI user
  use_cli = true
}

