# vpc values

region   = "us-east-1"
vpc_name = "nopprod"
vpc_cidr = "10.0.0.0/16"

# app1 values
app1_subnet_name = "prod-app1"
app1_cidr        = "10.0.1.0/24"
app1_subnet_az   = "us-east-1a"

# app2 values

app2_cidr        = "10.0.2.0/24"
app2_subnet_az   = "us-east-1b"
app2_subnet_name = "prod-app2"

# db1 values

db1_cidr        = "10.0.11.0/24"
db1_subnet_az   = "us-east-1a"
db1_subnet_name = "prod-db1"

# db2 values

db2_cidr        = "10.0.12.0/24"
db2_subnet_az   = "us-east-1b"
db2_subnet_name = "prod-db2"

