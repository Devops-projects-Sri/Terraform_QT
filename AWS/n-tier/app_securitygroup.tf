# creating security groups for app servers


resource "aws_security_group" "app" {
  name        = var.app_sg.name
  vpc_id      = aws_vpc.vpc.id
  description = var.app_sg.description
  tags = {
    Name = var.app_sg.name
  }
  depends_on = [aws_vpc.vpc]
}

# one cidr block per rule
# from_port and to_port denotes the range of ports you want opened in aws
# from_port does not denote the client port which is random and ephemeral

resource "aws_vpc_security_group_ingress_rule" "app" {
  count             = length(var.app_sg.ingress_rules)
  security_group_id = aws_security_group.app.id
  ip_protocol       = var.app_sg.ingress_rules[count.index].ip_protocol
  from_port         = var.app_sg.ingress_rules[count.index].from_port
  cidr_ipv4         = var.app_sg.ingress_rules[count.index].cidr_ipv4
  to_port           = var.app_sg.ingress_rules[count.index].to_port
  description       = var.app_sg.ingress_rules[count.index].description
  depends_on        = [aws_security_group.app]
}

# one cidr block per rule
resource "aws_vpc_security_group_egress_rule" "app" {
  count             = length(var.app_sg.egress_rules)
  security_group_id = aws_security_group.app.id
  ip_protocol       = var.app_sg.egress_rules[count.index].ip_protocol
  from_port         = var.app_sg.egress_rules[count.index].from_port
  cidr_ipv4         = var.app_sg.egress_rules[count.index].cidr_ipv4
  to_port           = var.app_sg.egress_rules[count.index].to_port
  description       = var.app_sg.egress_rules[count.index].description
  depends_on        = [aws_security_group.app]
}

