# VPC

resource "aws_vpc" "noptf" {
  cidr_block = var.network_info.cidr
  tags = {
    Name = var.network_info.name
  }
}

# Subnets

## Private
  # count depends on number of defined private subnets

resource "aws_subnet" "private_subnets" {
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
  # count depends on number of defined public subnets

resource "aws_subnet" "public_subnets" {
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
  # count depends on whether the number of defined public subnets is > 0. 
  # ig is created only when public subnets exist

resource "aws_internet_gateway" "ig" {
  count  = length(var.network_info.public_subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.noptf.id
  tags = {
    Name = var.network_info.name
  }

}

# Route table

## Public
  # count depends on whether the number of defined public subnets is > 0
  # rt will be created only if public subnets exist

resource "aws_route_table" "public" {
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
  # count depends on whether the number of defined private subnets is > 0
  # rt will be created only if private subnets exist

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
  # count depends on whether the number of defined public subnets is > 0

resource "aws_route_table_association" "public" {
  count          = length(var.network_info.public_subnets)
  route_table_id = aws_route_table.public[0].id
  subnet_id      = aws_subnet.public_subnets[count.index].id
  depends_on     = [aws_route_table.public, aws_subnet.public_subnets]
}
## Private
  # count depends on whether the number of defined private subnets is > 0

resource "aws_route_table_association" "private" {
  count          = length(var.network_info.private_subnets)
  route_table_id = aws_route_table.private[0].id
  subnet_id      = aws_subnet.private_subnets[count.index].id
  depends_on     = [aws_route_table.private, aws_subnet.private_subnets]
}