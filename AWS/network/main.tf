# VPC

resource "aws_vpc" "noptf" {
  cidr_block = var.vpc_info.cidr
  tags = {
    Name = var.vpc_info.name
  }
}

# Subnets

## app1 Subnet

resource "aws_subnet" "app1" {
  vpc_id            = aws_vpc.noptf.id
  availability_zone = var.app1_subnet_info.az
  cidr_block        = var.app1_subnet_info.cidr

  tags = {
    Name = var.app1_subnet_info.name
  }

  depends_on = [aws_vpc.noptf]
}

## app2 subnet

resource "aws_subnet" "app2" {
  vpc_id            = aws_vpc.noptf.id
  availability_zone = var.app2_subnet_info.az
  cidr_block        = var.app2_subnet_info.cidr

  tags = {
    Name = var.app2_subnet_info.name
  }

  depends_on = [aws_vpc.noptf]
}

## db1 subnet

resource "aws_subnet" "db1" {
  vpc_id            = aws_vpc.noptf.id
  availability_zone = var.db1_subnet_info.az
  cidr_block        = var.db1_subnet_info.cidr

  tags = {
    Name = var.db1_subnet_info.name
  }

  depends_on = [aws_vpc.noptf]
}

## db2 subnet

resource "aws_subnet" "db2" {
  vpc_id            = aws_vpc.noptf.id
  availability_zone = var.db2_subnet_info.az
  cidr_block        = var.db2_subnet_info.cidr

  tags = {
    Name = var.db2_subnet_info.name
  }

  depends_on = [aws_vpc.noptf]
}
