
output "output_vpc_id" {
  value = aws_vpc.vpc.id
}

output "output_subnet_pub_a_id" {
  value = aws_subnet.public_a.id
}

output "output_subnet_pub_c_id" {
  value = aws_subnet.public_c.id
}

output "output_igw_id" {
  value = aws_internet_gateway.main.id
}