# creating security groups for web servers


resource "aws_security_group" "web" {
  name = var.web_sg.name
  vpc_id = aws_vpc.vpc.id
  description = 
  tags = {
    
  }
  depends_on = [  ]
}

resource "aws_vpc_security_group_rule" "web" {
  
}


resource "aws_security_group" "web" {
  name        = var.web_security_group.name
  vpc_id      = aws_vpc.base.id
  description = var.web_security_group.description
  tags = {
    Name = var.web_security_group.name
  }

  depends_on = [aws_vpc.base]
}