region = "us-east-1"
vpc_info = {
    cidr_block           = "10.113.0.0/16"
    name                 = "ntier"
    enable_dns_hostnames = true
    enable_dns_support   = true
}

public_subnet_info = [ 
  {
    name              = "web1"
    cidr_block        = "10.113.1.0/24"
    availability_zone = "us-east-1a"
    }, {
    name              = "web2"
    cidr_block        = "10.113.2.0/24"
    availability_zone = "us-east-1b"
  }
 ]

 private_subnet_info = [ 
   {
    name              = "app1"
    cidr              = "10.113.11.0/24"
    availability_zone = "us-east-1a"
    },
    {
      name              = "app2"
      cidr              = "10.113.12.0/24"
      availability_zone = "us-east-1b"
    },
    {
      name              = "db1"
      cidr              = "10.113.21.0/24"
      availability_zone = "us-east-1a"
    },
    {
      name              = "db2"
      cidr              = "10.113.22.0/24"
      availability_zone = "us-east-1b"
  }
  ]