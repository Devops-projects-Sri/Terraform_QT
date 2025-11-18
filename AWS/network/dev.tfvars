# vpc values

region   = "us-east-1"
vpc_info = {
  name = "nopdev"
  cidr = "10.10.0.0/16"
}

# app1 values

app1_subnet_info = {
  az = "us-east-1a"
  cidr = "10.10.1.0/24"
  name = "dev-app1"
}

# app2 values

app2_subnet_info = {
  az = "us-east-1b"
  cidr = "10.10.2.0/24"
  name = "dev-app2"
}

# db1 values

db1_subnet_info = {
  az = "us-east-1a"
  cidr = "10.10.11.0/24"
  name = "dev-db1"
}

# db2 values

db2_subnet_info = {
  az = "us-east-1b"
  cidr = "10.10.12.0/24"
  name = "dev-db2"
}
