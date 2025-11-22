# Creating a tiered application architecture


resource "azurerm_resource_group" "ntier" {
  name     = var.resource_group.name
  location = var.resource_group.location
}

resource "azurerm_virtual_network" "ntier" {
  name                = var.network_info.name
  location            = azurerm_resource_group.ntier.location
  resource_group_name = azurerm_resource_group.ntier.name
  address_space       = [var.network_info.address_space]
  tags = {
    environment = "Dev"
  }
  depends_on = [azurerm_resource_group.ntier]
}

