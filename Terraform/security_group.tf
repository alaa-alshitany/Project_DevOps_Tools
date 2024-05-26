resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh from 0.0.0.0/0"
  vpc_id      = module.network_module.vpc_id
   ingress {
    description     = "Allow SSH from anywhere"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]  
   }
   egress {
    description     = "Allow SSH to anywhere"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]  
   }
  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow_ssh_and_3000" {
  name        = "allow_ssh_and_3000"
  description = "Allow SSH and Port 3000 from within the VPC"
  vpc_id      = module.network_module.vpc_id

  ingress {
    description     = "Allow SSH from VPC"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]  
  }

  ingress {
    description     = "Allow Port 3000 from VPC"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    cidr_blocks     = ["10.0.0.0/16"]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow SSH and Port 3000 from VPC"
  }
}

resource "aws_security_group" "redis_sg" {
  name          = "redis-sg"
  vpc_id        = module.network_module.vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds_sg" {
  name          = "rds-sg"
  vpc_id        = module.network_module.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg-alb" {
  vpc_id        = module.network_module.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-alb"
  }
}