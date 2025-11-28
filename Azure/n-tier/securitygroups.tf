# defining security group for web

resource "azurerm_network_security_group" "web" {
  resource_group_name = azurerm_resource_group.ntier.name # implicit dependency and association
  name                = var.web_security_group.name
  location            = azurerm_resource_group.ntier.location
  depends_on          = [azurerm_resource_group.ntier] #explicit dependency

}

# defining network security rule for web

resource "azurerm_network_security_rule" "web" {

  # implicit dependency and association
  network_security_group_name = azurerm_network_security_group.web.name
  resource_group_name         = azurerm_resource_group.ntier.name

  # defining nsrule using for_each
  for_each = var.web_security_group.rules

  name                       = each.key
  protocol                   = each.value.protocol
  direction                  = each.value.direction
  priority                   = each.value.priority
  access                     = each.value.access
  source_port_range          = each.value.source_port_range
  destination_port_range     = each.value.destination_port_range
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  depends_on = [azurerm_network_security_group.web, azurerm_resource_group.ntier]
}
