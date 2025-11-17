
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.21.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}


resource "aws_vpc" "terraform" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "practice_tf"
  }
}
