# webserver public ip
resource "azurerm_public_ip" "web" {

  resource_group_name = azurerm_resource_group.ntier.name # implicit dependency and association
  name                = "${var.webserver.name}-ip"        #string interpolation
  location            = azurerm_resource_group.ntier.location
  allocation_method   = "Static"
  depends_on          = [azurerm_resource_group.ntier] #explicit dependency

}

# using data source to fetch subnet id of web subnet
data "azurerm_subnet" "web" {
  name                 = var.webserver.subnet_name #using name to filter
  resource_group_name  = azurerm_resource_group.ntier.name
  virtual_network_name = azurerm_virtual_network.ntier.name
  depends_on           = [azurerm_subnet.ntier]
}

# webserver network interface
resource "azurerm_network_interface" "web" {

  location            = azurerm_resource_group.ntier.location
  name                = "${var.webserver.name}-nic" #string interpolation
  resource_group_name = azurerm_resource_group.ntier.name
  ip_configuration {
    name                          = var.webserver.name
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.web.id #refer data source block
    public_ip_address_id          = azurerm_public_ip.web.id
  }
  depends_on = [azurerm_public_ip.web, azurerm_subnet.ntier, azurerm_resource_group.ntier]

}

# creating a nic-sg association
resource "azurerm_network_interface_security_group_association" "web" {
  network_security_group_id = azurerm_network_security_group.web.id
  network_interface_id      = azurerm_network_interface.web.id
  depends_on                = [azurerm_network_interface.web, azurerm_network_security_group.web]
}


# creating a web vm

resource "azurerm_linux_virtual_machine" "web" {

  name                            = var.webserver.name
  resource_group_name             = azurerm_resource_group.ntier.name
  location                        = azurerm_resource_group.ntier.location
  network_interface_ids           = [azurerm_network_interface.web.id]
  admin_username                  = var.webserver.admin_username
  size                            = var.webserver.size
  disable_password_authentication = "false"
  admin_password                  = var.webserver.admin_password
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.webserver.publisher
    offer     = var.webserver.offer
    sku       = var.webserver.sku
    version   = var.webserver.version
  }
  # load user data from local file to execute commands
  user_data = filebase64("nginx.sh")

}

# using null resource to copy file and execute script
## iterate build id while executing tf apply using -var option

resource "null_resource" "web" {
  triggers = {
    build_id = var.build_id
  }

  # to establish ssh connection to web vm
  connection {
    host     = azurerm_linux_virtual_machine.web.public_ip_address # public ip from web vm
    type     = "ssh"
    user     = var.webserver.admin_username
    password = var.webserver.admin_password
  }

  # using file provisioner to copy index.html file from local folder to /tmp in vm
  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }

  # using remote exec to execute commands in web vm
  provisioner "remote-exec" {
    script = "nginx.sh"
  }

}

