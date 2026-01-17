terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0" # Using the latest 2026 provider standard
    }
  }

  # This is where your pipeline stores its "memory"
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "youruniquestorageacct" # Replace with your storage name
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true # Crucial for GitHub Actions authentication
}