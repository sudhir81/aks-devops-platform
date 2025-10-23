terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.88.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.0.0"
    }
  }
  required_version = ">=1.2.0"
}

# Provider for Azure (supports both local CLI and OIDC via GitHub Actions)
provider "azurerm" {
  features {}

  # This allows Terraform to authenticate using GitHub OIDC
  # when running inside GitHub Actions
  use_oidc                   = true
  skip_provider_registration = false
}

