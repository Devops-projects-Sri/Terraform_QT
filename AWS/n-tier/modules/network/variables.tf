# var info for defaults

variable "region" {
  type    = string
}


# var info for vpc
variable "vpc_info" {
  type = object({
    name                 = string
    cidr_block           = string
    enable_dns_hostnames = bool
    enable_dns_support   = bool
  })
}

# var info for public subnets
variable "public_subnet_info" {
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
}

# var info for private subnet
variable "private_subnet_info" {
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
}