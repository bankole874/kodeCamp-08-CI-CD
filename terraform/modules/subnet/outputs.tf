output "public_subnet_id" {
  value = aws_subnet.publicSubnet.id
}

output "public_subnet_cidr" {
  value = aws_subnet.publicSubnet.cidr_block
}
