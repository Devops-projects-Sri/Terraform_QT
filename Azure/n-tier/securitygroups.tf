resource "azurerm_network_security_group" "web" {
  name                = var.web_security_group.name
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location

}

resource "azurerm_network_security_rule" "web" {
    count = length(var.web_security_group.rules)
    name = var.web_security_group.rules[count.index].name
    protocol = var.web_security_group.rules[count.index].protocol
    direction = var.web_security_group.rules[count.index].direction
    priority = var.web_security_group.rules[count.index].priority
    access = var.web_security_group.rules[count.index].access
    network_security_group_name = azurerm_network_security_group.web.name
    resource_group_name = azurerm_resource_group.ntier.name
    source_port_range           = var.web_security_group.rules[count.index].source_port_range
    destination_port_range      = var.web_security_group.rules[count.index].destination_port_range
    source_address_prefix       = var.web_security_group.rules[count.index].source_address_prefix
    destination_address_prefix  = var.web_security_group.rules[count.index].destination_address_prefix
}
