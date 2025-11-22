# VPC info

variable "region" {
  type        = string
  description = "region for the current template"
  default     = "us-east-1" #the default value that will be passed when user does not pass a value
}


variable "default_cidr" {
  type        = string
  description = "this is the cidr value of the default vpc"
  default     = "172.31.0.0/16"
}

  