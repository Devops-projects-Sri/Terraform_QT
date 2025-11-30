# creating security groups for web servers


resource "aws_security_group" "sg" {
  name        = var.security_group.name
  vpc_id      = var.vpc_id
  description = var.security_group.description
  tags = {
    Name = var.security_group.name
  }
  depends_on = [aws_vpc.vpc]
}

# one cidr block per rule
# from_port and to_port denotes the range of ports you want opened in aws
# from_port does not denote the client port which is random and ephemeral

resource "aws_vpc_security_group_ingress_rule" "sg" {
  count             = length(var.security_group.ingress_rules)
  security_group_id = aws_security_group.sg.id
  ip_protocol       = var.security_group.ingress_rules[count.index].ip_protocol
  from_port         = var.security_group.ingress_rules[count.index].from_port
  cidr_ipv4         = var.security_group.ingress_rules[count.index].cidr_ipv4
  to_port           = var.security_group.ingress_rules[count.index].to_port
  description       = var.security_group.ingress_rules[count.index].description
  depends_on        = [aws_security_group.sg]
}

# one cidr block per rule
resource "aws_vpc_security_group_egress_rule" "sg" {
  count             = length(var.security_group.egress_rules)
  security_group_id = aws_security_group.sg.id
  ip_protocol       = var.security_group.egress_rules[count.index].ip_protocol
  from_port         = var.security_group.egress_rules[count.index].from_port
  cidr_ipv4         = var.security_group.egress_rules[count.index].cidr_ipv4
  to_port           = var.security_group.egress_rules[count.index].to_port
  description       = var.security_group.egress_rules[count.index].description
  depends_on        = [aws_security_group.sg]
}

