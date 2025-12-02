region = "us-east-1"

vpc_info = {
  cidr_block           = "10.113.0.0/16"
  name                 = "ntier-dev"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

public_subnet_info = [
  {
    name              = "web1"
    cidr_block        = "10.113.1.0/24"
    availability_zone = "us-east-1a"
  },
  {
    name              = "web2"
    cidr_block        = "10.113.2.0/24"
    availability_zone = "us-east-1b"
  }
]

private_subnet_info = [
  {
    name              = "app1"
    cidr_block        = "10.113.11.0/24"
    availability_zone = "us-east-1a"
  },
  {
    name              = "app2"
    cidr_block        = "10.113.12.0/24"
    availability_zone = "us-east-1b"
  },
  {
    name              = "db1"
    cidr_block        = "10.113.21.0/24"
    availability_zone = "us-east-1a"
  },
  {
    name              = "db2"
    cidr_block        = "10.113.22.0/24"
    availability_zone = "us-east-1b"
  }
]

# from_port and to_port denotes the range of ports you want opened in aws
# from_port does not denote the client port which is random and ephemeral
# only one port range is allowed per rule in the below ingress definition
# egress rule allows all ports and all protocols

web_sg = {
  description = "open ports for web layer"
  name        = "web_security_group"
  ingress_rules = [{
    name        = "http"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    description = "allow everyone to access http"
    },
    {
      name        = "https"
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      description = "allow everyone to access https"
    },
    {
      name        = "ssh"
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      description = "allow everyone to access ssh"
  }]
  egress_rules = [{
    name        = "allow all"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 0
    to_port     = 0
    ip_protocol = "-1"
    description = "allow all outgoing traffic"
  }]
}

app_sg = {
  description = "open ports for app layer"
  name        = "app_security_group"
  ingress_rules = [{
    name        = "open 8080 port"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 8080
    to_port     = 8080
    ip_protocol = "tcp"
    description = "allow everyone to access 8080"
    },
    {
      name        = "ssh"
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      description = "allow everyone to access ssh"
  }]
  egress_rules = [{
    name        = "allow all"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 0
    to_port     = 0
    ip_protocol = "-1"
    description = "allow all outgoing traffic"
  }]
}


db_sg = {
  description = "open ports for db layer"
  name        = "db_security_group"
  ingress_rules = [{
    name        = "open 8080 port"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 3306
    to_port     = 3306
    ip_protocol = "tcp"
    description = "allow everyone to access mysql"
    },
    {
      name        = "ssh"
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      description = "allow everyone to access ssh"
  }]
  egress_rules = [{
    name        = "allow all"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 0
    to_port     = 0
    ip_protocol = "-1"
    description = "allow all outgoing traffic"
  }]
}
