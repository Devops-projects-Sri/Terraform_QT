output "vpc_id" {
  value = data.aws_vpc.default.id
}

output "subnet-ids" {
  value = data.aws_subnets.default.ids
}

output "aws_route_table" {
  value = data.aws_route_table.default.route_table_id
}
