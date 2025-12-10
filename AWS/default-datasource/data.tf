

data "aws_vpc" "default" {
  region     = var.region
  cidr_block = var.default_cidr
}

# Using vpc id to filter subnet
data "aws_subnets" "default" {
  region = var.region
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_route_table" "default" {
  region = var.region
  vpc_id = data.aws_vpc.default.id

}

