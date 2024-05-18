output "subnets" {
  value = aws_subnet.subnets
  sensitive = true
  description = "subnets"
}

output "vpc_id" {
  value = aws_vpc.main.id
  description = "vpc_id"
}

output "cidr_block" {
  value = aws_vpc.main.cidr_block
  description = "cidr_block"
}

output "subnets_data" {
  value = var.subnets_data
}