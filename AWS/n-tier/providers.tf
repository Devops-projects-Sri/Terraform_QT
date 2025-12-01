terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.23.0"
    }
  }
  backend "s3" {
    bucket = "amzn-tf-qt-state"
    key    = "n-tier/dev"
    region = "us-east-1"
    use_lockfile = true
  }
  required_version = ">= 1.11.0"
}

provider "aws" {
  region = var.region
  default_tags {
    tags = var.default_tags
  }
}