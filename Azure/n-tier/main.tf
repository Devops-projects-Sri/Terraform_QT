# Creating a tiered application architecture

# Creating a Resource group ntier
resource "azurerm_resource_group" "ntier" {
  name     = var.resource_group.name
  location = var.resource_group.location
}





