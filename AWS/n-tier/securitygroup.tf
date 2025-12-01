# creating security groups for servers using security group module
# var info defined in module securitygroup

module "db_security_group" {

  #use git module repo to use v1.0.0
  #source = "git::https://github.com/Devops-projects-Sri/Terraform_QT_modules.git//AWS/modules/securitygroup?ref=v1.0.0"


  source         = "./modules/securitygroup"
  vpc_id         = module.network.vpc_id
  security_group = var.db_sg
}

module "web_security_group" {

  #use git module repo to use v1.0.0
  #source = "git::https://github.com/Devops-projects-Sri/Terraform_QT_modules.git//AWS/modules/securitygroup?ref=v1.0.0"


  source         = "./modules/securitygroup"
  vpc_id         = module.network.vpc_id #input from module network/outputs.tf
  security_group = var.web_sg
}

module "app_security_group" {

  #use git module repo to use v1.0.0
  #source = "git::https://github.com/Devops-projects-Sri/Terraform_QT_modules.git//AWS/modules/securitygroup?ref=v1.0.0"


  source         = "./modules/securitygroup"
  vpc_id         = module.network.vpc_id
  security_group = var.app_sg
}