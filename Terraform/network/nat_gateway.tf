resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    "Name" = "${var.common_resource_name}_eip"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnets["public_subnet_1"].id
  tags = {
    Name = "${var.common_resource_name}_NGW"
  }
}
