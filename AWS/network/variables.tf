# VPC info

variable "region" {
  type        = string
  description = "this is the region for the current template"
  default     = "us-east-1" #the default value that will be passed when a value is not passed
}

variable "vpc_info" {
  description = "vpc info"
  type        = object({
    name = string
    cidr = string
  })
  
  default = {
    name = "noptf"
    cidr = "10.0.0.0/16" 
  }
}

# Subnet info

## App1 Subnet info

variable "app1_subnet_info" {
  description = "app1 subnet info"
  type        = object({
    name = string
    cidr = string
    az = string
  })
  
  default = {
    name = "app1"
    cidr = "10.0.1.0/24"
    az = "us-east-1a"
  }
}


## App2 subnet info

variable "app2_subnet_info" {
  description = "app2 subnet info"
  type        = object({
    name = string
    cidr = string
    az = string
  })
  
  default = {
    name = "app2"
    cidr = "10.0.2.0/24"
    az = "us-east-1b"
  }
}

## Db1 subnet info

variable "db1_subnet_info" {
  description = "db1 subnet info"
  type        = object({
    name = string
    cidr = string
    az = string
  })
  
  default = {
    name = "db1"
    cidr = "10.0.11.0/24"
    az = "us-east-1a"
  }
}


## db2 subnet info

variable "db2_subnet_info" {
  description = "db2 subnet info"
  type        = object({
    name = string
    cidr = string
    az = string
  })
  
  default = {
    name = "db2"
    cidr = "10.0.12.0/24"
    az = "us-east-1b"
  }
}
