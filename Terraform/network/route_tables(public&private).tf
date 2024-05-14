resource "aws_route_table" "RT" {
  count=2
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = count.index == 0? aws_internet_gateway.igw.id:aws_nat_gateway.ngw.id
  }
  tags = {
    Name = "${var.common_resource_name}_RT"
  }
}

resource "aws_route_table_association" "pub_rt_associate" {
  subnet_id      = aws_subnet.subnets["public_subnet_1"].id
  route_table_id = aws_route_table.RT[0].id
}


resource "aws_route_table_association" "priv_rt_associate" {
  subnet_id      = aws_subnet.subnets["private_subnet_1"].id
  route_table_id = aws_route_table.RT[1].id
}