# VPC info

variable "region" {
  type        = string
  description = "this is the region for the current template"
  default     = "us-east-1" #the default value that will be passed when a value is not passed
}

variable "vpc_name" {
  type        = string
  description = "name of the vpc"
  default     = "noptf"
}

variable "vpc_cidr" {
  type        = string
  description = "this is the cidr value of the vpc"
  default     = "10.0.0.0/16"
}

# Subnet info

## Subnet names
variable "app1_subnet_name" {
  type        = string
  description = "name of app1 subnet"
  default     = "app1"
}

variable "app2_subnet_name" {
  type        = string
  description = "name of app 2 subnet"
  default     = "app2"
}

variable "db1_subnet_name" {
  type        = string
  description = "name of db1 subnet"
  default     = "db1"
}

variable "db2_subnet_name" {
  type        = string
  description = "name of db2 subnet"
  default     = "db2"
}

## Subnet AZ info

variable "app1_subnet_az" {
  type        = string
  description = "az where app1 resides"
  default     = "us-east-1a"
}

variable "app2_subnet_az" {
  type        = string
  description = "az where app1 resides"
  default     = "us-east-1b"
}

variable "db1_subnet_az" {
  type        = string
  description = "az where db1 resides"
  default     = "us-east-1a"
}

variable "db2_subnet_az" {
  type        = string
  description = "az where db2 resides"
  default     = "us-east-1b"
}

## Subnet CIDR

variable "app1_cidr" {
  type        = string
  description = "app1 subnet"
  default     = "10.0.1.0/24"
}

variable "app2_cidr" {
  type        = string
  description = "app2 subnet"
  default     = "10.0.2.0/24"
}

variable "db1_cidr" {
  type        = string
  description = "db1 subnet"
  default     = "10.0.11.0/24"
}

variable "db2_cidr" {
  type        = string
  description = "db2 subnet"
  default     = "10.0.12.0/24"
}

