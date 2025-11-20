# vpc values

region = "us-east-1"
network_info = {
  name = "nopdev"
  cidr = "10.10.0.0/16"
  private_subnets = [
    {
      az   = "us-east-1a"
      cidr = "10.10.1.0/24"
      name = "dev-app1"
    },
    {
      az   = "us-east-1b"
      cidr = "10.10.2.0/24"
      name = "dev-app2"
  }]
  public_subnets = [{
    az   = "us-east-1a"
    cidr = "10.10.11.0/24"
    name = "dev-db1"
    },
    {
      az   = "us-east-1b"
      cidr = "10.10.12.0/24"
      name = "dev-db2"
  }]
}

