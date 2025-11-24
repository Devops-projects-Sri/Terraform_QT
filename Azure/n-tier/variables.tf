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

# define network info - 

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
        address_space = "192.168.1.0/24"
      },

      {
        name          = "db"
        address_space = "192.168.3.0/24"
      }
    ]
  }
}

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


variable "webserver" {
  type = object({
    name = string
  })

  default = {
    name = "web1"
  }
  
}

