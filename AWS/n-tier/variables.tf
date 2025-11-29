# var info for defaults

variable "region" {
  type = string
  default = "us-east-1"
}

variable "default_tags" {
    type = map(string)
    default = {
        "Env" = "dev"
        "Createdby" = "Terraform"
    }
}

# var info for vpc
variable "vpc_info" {
  type = object({
    name                 = string
    cidr_block           = string
    enable_dns_hostnames = bool
    enable_dns_support = bool
  })
  default = {
    cidr_block           = "10.113.0.0/16"
    name                 = "ntier"
    enable_dns_hostnames = true
    enable_dns_support = true
  }
}


# var info for public subnets
variable "public_subnet_info" {
    type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
  default = [{
    name              = "web1"
    cidr_block        = "10.113.1.0/24"
    availability_zone = "us-east-1a"
    }, {
    name              = "web2"
    cidr_block        = "10.113.2.0/24"
    availability_zone = "us-east-1b"
  }]
}

# var info for private subnet
variable "private_subnet_info" {
    
    type = list(object({
      name = string
      cidr= string
      availability_zone = string
    }))

    default = [ {
      name = "app1"
      cidr = "10.113.11.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name = "app2"
      cidr = "10.113.12.0/24"
      availability_zone = "us-east-1b"
    },
    {
      name = "db1"
      cidr = "10.113.21.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name = "db2"
      cidr = "10.113.22.0/24"
      availability_zone = "us-east-1b"
    } ]
}

# var info for web security group
variable "web_sg" {
  type = object({
    name        = string
    description = string
    ingress_rules = list(object({
      name        = string
      cidr_ipv4   = string
      description = string
      from_port   = number
      to_port     = number
      ip_protocol = string
    }))

    egress_rules = list(object({
      name        = string
      cidr_ipv4   = string
      description = string
      from_port   = number
      to_port     = number
      ip_protocol = string
    }))
  })
}


variable "build_id" {
  type    = string
  default = "1"
}