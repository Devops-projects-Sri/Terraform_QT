# VPC

resource "aws_vpc" "noptf" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "noptf"
  }
}


# Subnets

## app1 Subnet

resource "aws_subnet" "app1" {
  vpc_id            = aws_vpc.noptf.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.1.0/24"

  tags = {
    Name = "app1-us-east-1a"
  }

  depends_on = [aws_vpc.noptf]
}

## app2 subnet

resource "aws_subnet" "app2" {
  vpc_id            = aws_vpc.noptf.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.2.0/24"

  tags = {
    Name = "app2-us-east-1b"
  }

  depends_on = [aws_vpc.noptf]
}

## db1 subnet

resource "aws_subnet" "db1" {
  vpc_id            = aws_vpc.noptf.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.11.0/24"

  tags = {
    Name = "db1-us-east-1a"
  }

  depends_on = [aws_vpc.noptf]
}

## db2 subnet

resource "aws_subnet" "db2" {
  vpc_id            = aws_vpc.noptf.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.12.0/24"

  tags = {
    Name = "db2-us-east-1b"
  }

  depends_on = [aws_vpc.noptf]
}
