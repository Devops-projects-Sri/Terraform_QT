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

# define network info

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
