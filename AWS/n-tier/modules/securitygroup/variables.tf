# var info is passed from module block in securitygroup.tf

variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "security_group" {
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