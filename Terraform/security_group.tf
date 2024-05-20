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
    cidr_blocks     = [module.network_module.cidr_block]  
  }

  ingress {
    description     = "Allow Port 3000 from VPC"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    cidr_blocks     = [module.network_module.cidr_block]  
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

