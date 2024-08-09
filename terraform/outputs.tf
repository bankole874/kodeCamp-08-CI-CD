output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.subnet.public_subnet_id
}

output "igw_id" {
  value = module.internet_gateway.igw_id
}

output "public_route_table_id" {
  value = module.route_table.public_route_table_id
}

output "public_security_group_id" {
  value = module.security_group.public_security_group_id
}

output "public_instance_id" {
  value = module.ec2_instance.public_instance_id
}
