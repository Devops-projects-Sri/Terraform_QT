# creating security groups for servers using security group module
# var info defined in module securitygroup

module "db_security_group" {
  source         = "./modules/securitygroup"
  vpc_id         = aws_vpc.vpc.id
  security_group = var.db_sg
}

module "web_security_group" {
  source         = "./modules/securitygroup"
  vpc_id         = aws_vpc.vpc.id
  security_group = var.web_sg
}

module "app_security_group" {
  source         = "./modules/securitygroup"
  vpc_id         = aws_vpc.vpc.id
  security_group = var.app_sg
}