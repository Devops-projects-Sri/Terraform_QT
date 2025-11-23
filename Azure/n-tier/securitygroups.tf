# defining security group for web

resource "azurerm_network_security_group" "web" {
# associating with rg
  resource_group_name = azurerm_resource_group.ntier.name

  name                = var.web_security_group.name
  location            = azurerm_resource_group.ntier.location

}

# defining network security rule for web
# 

resource "azurerm_network_security_rule" "web" {

# this part is used for association with nsg and rg
  network_security_group_name = azurerm_network_security_group.web.name
  resource_group_name         = azurerm_resource_group.ntier.name

  count                       = length(var.web_security_group.rules)
  name                        = var.web_security_group.rules[count.index].name
  protocol                    = var.web_security_group.rules[count.index].protocol
  direction                   = var.web_security_group.rules[count.index].direction
  priority                    = var.web_security_group.rules[count.index].priority
  access                      = var.web_security_group.rules[count.index].access
  source_port_range           = var.web_security_group.rules[count.index].source_port_range
  destination_port_range      = var.web_security_group.rules[count.index].destination_port_range
  source_address_prefix       = var.web_security_group.rules[count.index].source_address_prefix
  destination_address_prefix  = var.web_security_group.rules[count.index].destination_address_prefix

  depends_on = [azurerm_network_security_group.web, azurerm_resource_group.ntier]
}
