# VPC

resource "aws_vpc" "noptf" {
  cidr_block = var.network_info.cidr
  tags = {
    Name = var.network_info.name
  }
}

# Subnets

## Private
resource "aws_subnet" "private_subnets" {
  # count depends on number of defined private subnets
  count             = length(var.network_info.private_subnets)
  cidr_block        = var.network_info.private_subnets[count.index].cidr
  availability_zone = var.network_info.private_subnets[count.index].az
  vpc_id            = aws_vpc.noptf.id

  tags = {
    Name = var.network_info.private_subnets[count.index].name
  }

  depends_on = [aws_vpc.noptf]
}

## Public
resource "aws_subnet" "public_subnets" {
  # count depends on number of defined public subnets
  count             = length(var.network_info.public_subnets)
  cidr_block        = var.network_info.public_subnets[count.index].cidr
  availability_zone = var.network_info.public_subnets[count.index].az
  vpc_id            = aws_vpc.noptf.id

  tags = {
    Name = var.network_info.public_subnets[count.index].name
  }

  depends_on = [aws_vpc.noptf]
}

# Internet Gateway

resource "aws_internet_gateway" "ig" {
  # count depends on whether the number of defined public subnets is > 0
  count  = length(var.network_info.public_subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.noptf.id
  tags = {
    Name = var.network_info.name
  }

}

# Route table

## Public
resource "aws_route_table" "public" {
  # count depends on whether the number of defined public subnets is > 0
  count  = length(var.network_info.public_subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.noptf.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig[0].id
  }
  tags = {
    Name = "public"
  }

}

## Private
resource "aws_route_table" "private" {
  count  = length(var.network_info.private_subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.noptf.id
  tags = {
    Name = "private"
  }
  depends_on = [aws_vpc.noptf]

}
# Route table association

## Public

## Private
