locals {
  ssh_private_key = "s3://lab2-env-bk/private_key.pem" 
}

resource "aws_instance" "bastion" {
  ami           = "ami-07caf09b362be10b8" 
  instance_type = var.machine_data["type"]    
  subnet_id     = module.network_module.subnets["public_subnet_1"].id 
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name      = aws_key_pair.ssh_key.key_name
  tags = {
    Name = "${var.common_resource_name}_Bastion"
  }
 user_data = <<-EOF
    #!/bin/bash
    mkdir -p /home/ec2-user/.ssh
    aws s3 cp s3://lab2-env-bk/private_key.pem /home/ec2-user/.ssh/id_rsa
    chmod 600 /home/ec2-user/.ssh/id_rsa
    chown ec2-user:ec2-user /home/ec2-user/.ssh/id_rsa
  EOF

}

resource "aws_instance" "application" {
  ami           = "ami-07caf09b362be10b8"  
  instance_type = var.machine_data["type"]    
  subnet_id     = module.network_module.subnets["private_subnet_1"].id  
  vpc_security_group_ids = [aws_security_group.allow_ssh_and_3000.id]
  key_name      = aws_key_pair.ssh_key.key_name
  tags = {
    Name = "${var.common_resource_name}_Application Server"
  }
}
