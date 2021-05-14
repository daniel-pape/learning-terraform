output "vpc_id" {
  value = aws_vpc.module_vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.module_vpc.cidr_block
}

output "public_subnet_cidr" {
  value = aws_subnet.module_public_subnet.cidr_block
}

output "private_subnet_cidr" {
  value = aws_subnet.module_private_subnet.cidr_block
}