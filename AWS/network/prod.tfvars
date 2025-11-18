# vpc values

region   = "us-east-1"
vpc_info = {
  name = "nopprod"
  cidr = "10.0.0.0/16"
}

# app1 values

app1_subnet_info = {
  az = "us-east-1a"
  cidr = "10.0.1.0/24"
  name = "prod-app1"
}

# app2 values

app1_subnet_info = {
  az = "us-east-1b"
  cidr = "10.0.2.0/24"
  name = "prod-app2"
}

# db1 values

db1_subnet_info = {
  az = "us-east-1a"
  cidr = "10.0.11.0/24"
  name = "prod-db1"
}

# db2 values

db2_subnet_info = {
  az = "us-east-1b"
  cidr = "10.0.12.0/24"
  name = "prod-db2"
}

