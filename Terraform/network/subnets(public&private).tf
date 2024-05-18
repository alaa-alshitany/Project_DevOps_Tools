resource "aws_subnet" "subnets" {
for_each = {for subnet in var.subnets_data : subnet.name => subnet}
vpc_id= aws_vpc.main.id
cidr_block=each.value.cidr
availability_zone=each.value.az
map_public_ip_on_launch=each.value.map_public_ip_on_launch
tags = {
    Name = "${var.common_resource_name}_${each.value.name}_subnet"
  }
}
