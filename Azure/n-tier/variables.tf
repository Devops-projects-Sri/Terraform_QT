# defining resource group info

variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
  description = "resource group information"
  default = {
    location = "eastus"
    name     = "ntier"
  }

}

# defining network info using nested object variable
# list(object) used for count

variable "network_info" {
  type = object({
    name          = string
    address_space = string
    subnets = list(object({
      name          = string
      address_space = string
    }))
  })
  default = {
    name          = "ntier"
    address_space = "192.168.0.0/16"
    subnets = [{
      name          = "web"
      address_space = "192.168.1.0/24"
      },
      {
        name          = "app"
        address_space = "192.168.2.0/24"
      },

      {
        name          = "db"
        address_space = "192.168.3.0/24"
      }
    ]
  }
}

# define web sg info using nested object variable
# map(object) used for for_each. contains key value pairs

variable "web_security_group" {
  type = object({
    name = string
    rules = map(object({
      protocol                   = string
      direction                  = string
      access                     = string
      priority                   = number
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  })
  default = {
    name = "websg"
    rules = {

      "websssh" = {
        priority                   = 300
        direction                  = "Inbound"
        protocol                   = "Tcp"
        access                     = "Allow"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      "webhttp" = {

        priority                   = 310
        direction                  = "Inbound"
        protocol                   = "Tcp"
        access                     = "Allow"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      "webhttps" = {
        priority                   = 320
        direction                  = "Inbound"
        protocol                   = "Tcp"
        access                     = "Allow"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

# defining webserver info
## uses hardcoded username and password. replace and move to vault as necessary

variable "webserver" {
  type = object({
    name           = string
    subnet_name    = string
    admin_username = optional(string, "devopsadmin")
    admin_password = optional(string, "qtdevops@123")
    publisher      = string
    offer          = string
    sku            = string
    size           = optional(string, "Standard B1s")
    version        = string
  })

  default = {
    name           = "web1"
    subnet_name    = "web"
    publisher      = "Canonical"
    offer          = "0001-com-ubuntu-server-jammy"
    sku            = "22_04-lts"
    version        = "latest"
    admin_username = "devopsadmin"
    admin_password = "qtdevops@123"
    size           = "Standard B1s"
  }

}

## use build id while executing tf apply
variable "build_id" {
  type    = string
  default = "1"
}

