terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
    backend "azurerm" {
    resource_group_name = "backups"
    storage_account_name = "qttfstate"
    container_name = "ntier"
    key = "dev"

  }
  required_version = "> 1.11.0"
}

provider "azurerm" {
  # Configuration options
  features {

  }
}