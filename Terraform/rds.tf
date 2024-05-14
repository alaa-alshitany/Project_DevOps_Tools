resource "aws_db_subnet_group" "database_subnet_group" {
  name       = "cloud_pd44_database_subnet_group"
  subnet_ids = [module.network_module.subnets["private_subnet_1"].id, module.network_module.subnets["private_subnet_2"].id]
  
  tags = {
    Name = "${var.common_resource_name}_database_Subnet_Group"
  }
}


resource "aws_db_instance" "rds_db" {
  allocated_storage    = 10
  db_name              = "lab2_terraform_mysql_rds"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "alaa"
  password             = "alaa12345"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.name
}
