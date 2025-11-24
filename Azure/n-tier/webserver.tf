resource "azurerm_public_ip" "web" {
    
    resource_group_name = azurerm_resource_group.ntier.name

#string interpolation
    name = "${var.webserver.name}-ip"
    location = azurerm_resource_group.ntier.location
    allocation_method = "Static"
  
}