

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.53.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    
  }
}

resource "azurerm_resource_group" "fromtf" {
  name     = "fromtf-resource"
  location = "East US"
}

resource "azurerm_storage_account" "store" {
  name = "fromtfqt2025"
  resource_group_name = "fromtf"
  location = "East US"
  account_tier = "Standard"
  account_replication_type = "RAGRS"
  depends_on = [ azurerm_resource_group.fromtf ]
}