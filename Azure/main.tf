
provider "azurerm" {
  # Configuration options
  features {

  }
}

resource "azurerm_resource_group" "fromtf" {
  name     = "fromtf1"
  location = "eastus"
}

resource "azurerm_storage_account" "store" {
  name                     = "fromtfstorage"
  resource_group_name      = azurerm_resource_group.fromtf.name
  location                 = azurerm_resource_group.fromtf.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  depends_on               = [azurerm_resource_group.fromtf]
}
