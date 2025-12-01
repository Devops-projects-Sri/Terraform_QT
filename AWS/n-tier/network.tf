
# # vpc info
# resource "aws_vpc" "vpc" {
#   cidr_block           = var.vpc_info.cidr_block
#   region               = var.region
#   enable_dns_support   = var.vpc_info.enable_dns_support   #Allows DNS resolution inside the VPC. enabled by default
#   enable_dns_hostnames = var.vpc_info.enable_dns_hostnames #enables public hostnames for ec2 in vpc with public IPs
#   tags = {
#     Name = var.vpc_info.name
#   }
# }


# ############################
# # subnet info

# # public 
# resource "aws_subnet" "public" {
#   count             = length(var.public_subnet_info)
#   vpc_id            = aws_vpc.vpc.id
#   region            = var.region
#   availability_zone = var.public_subnet_info[count.index].availability_zone
#   cidr_block        = var.public_subnet_info[count.index].cidr_block
#   tags = {
#     Name = var.public_subnet_info[count.index].name
#   }
#   depends_on = [aws_vpc.vpc]
# }

# # private
# resource "aws_subnet" "private" {
#   count             = length(var.private_subnet_info)
#   vpc_id            = aws_vpc.vpc.id
#   region            = var.region
#   availability_zone = var.private_subnet_info[count.index].availability_zone
#   cidr_block        = var.private_subnet_info[count.index].cidr_block
#   tags = {
#     Name = var.private_subnet_info[count.index].name
#   }
#   depends_on = [aws_vpc.vpc]
# }

# #######################################

# # configuring access to public internet for web subnet

# # internet gateway for public subnet
# resource "aws_internet_gateway" "igw" {
#   region = var.region
#   vpc_id = aws_vpc.vpc.id
#   tags = {
#     Name = format("%s-igw-web", var.vpc_info.name)
#   }
#   depends_on = [aws_vpc.vpc]
# }

# # route to public internet
# resource "aws_route" "internet" {
#   region                 = var.region
#   route_table_id         = data.aws_route_table.mainrt.id # refer datasource
#   destination_cidr_block = local.anywhere
#   gateway_id             = aws_internet_gateway.igw.id
#   depends_on             = [aws_internet_gateway.igw, data.aws_route_table.mainrt]
# }

# # fetch the default(main) route table id 
# # default rt gets created automatically. alternatively, create a rt and use that

# data "aws_route_table" "mainrt" {
#   region = var.region
#   vpc_id = aws_vpc.vpc.id
#   filter {
#     name   = "association.main" # indicates whether the rt is the main rt
#     values = ["true"]           # true - main rt
#   }
#   depends_on = [aws_vpc.vpc]
# }

# #############################

# # configuring nat gateway for private subnet

module "network" {

  #use git if local source is broken
  #source = "git::https://github.com/Devops-projects-Sri/Terraform_QT_modules.git//AWS/modules/network?ref=v1.0.0"

  
  source              = "./modules/network"
  region              = var.region
  vpc_info            = var.vpc_info
  public_subnet_info  = var.public_subnet_info
  private_subnet_info = var.private_subnet_info
}