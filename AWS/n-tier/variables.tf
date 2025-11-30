# var info for defaults

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "default_tags" {
  type = map(string)
  default = {
    "Env"       = "dev"
    "Createdby" = "Terraform"
  }
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

# var info for web security group
# one cidr block per rule for ingress and egress rules
# from_port and to_port denotes the range of ports you want opened in aws
# from_port does not denote the client port which is random and ephemeral

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

# var info for app security group
# one cidr block per rule for ingress and egress rules

variable "app_sg" {
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

# var info for db security group
# one cidr block per rule for ingress and egress rules

variable "db_sg" {
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