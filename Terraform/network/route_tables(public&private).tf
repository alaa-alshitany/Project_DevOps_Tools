resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_RT"
  }
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "private_RT"
  }
}



resource "aws_route_table_association" "public_rt_associations" {
  count          = 2
  subnet_id      = aws_subnet.subnets["public_subnet_1"].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_rt_associations" {
  count          = 2
  subnet_id      = aws_subnet.subnets["private_subnet_1"].id
  route_table_id = aws_route_table.private_route_table.id
}