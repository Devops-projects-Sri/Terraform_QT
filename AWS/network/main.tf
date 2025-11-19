# VPC

resource "aws_vpc" "noptf" {
  cidr_block = var.network_info.cidr
  tags = {
    Name = var.network_info.name
  }
}

# Subnets

resource "aws_subnet" "subnets" {
  count             = length(var.network_info.subnets)
  cidr_block        = var.network_info.subnets[count.index].cidr
  availability_zone = var.network_info.subnets[count.index].az
  vpc_id            = aws_vpc.noptf.id

  tags = {
    Name = var.network_info.subnets[count.index].name
  }

  depends_on = [aws_vpc.noptf]
}
