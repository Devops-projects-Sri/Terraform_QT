# Creating a Virtual network for ntier
resource "azurerm_virtual_network" "ntier" {
  name                = var.network_info.name
  location            = azurerm_resource_group.ntier.location
  resource_group_name = azurerm_resource_group.ntier.name
  address_space       = [var.network_info.address_space]
  tags = {
    environment = "Dev"
  }
  depends_on = [azurerm_resource_group.ntier] #explicit dependency
}

# Creating subnets using count.
# Count value is determined by number of subnets defined in network_info variable
resource "azurerm_subnet" "ntier" {
  count                = length(var.network_info.subnets)
  name                 = var.network_info.subnets[count.index].name
  resource_group_name  = azurerm_resource_group.ntier.name
  virtual_network_name = azurerm_virtual_network.ntier.name
  address_prefixes     = [var.network_info.subnets[count.index].address_space]
  depends_on = [azurerm_resource_group.ntier, azurerm_virtual_network.ntier] #explicit dependency
}