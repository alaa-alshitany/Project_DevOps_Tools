locals {
  ssh_private_key = file("${path.module}/key.pem")
}

resource "aws_instance" "bastion" {
  ami           = "ami-053a617c6207ecc7b"
  instance_type = var.machine_data["type"]    
  subnet_id     = module.network_module.subnets["public_subnet_1"].id 
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name      = aws_key_pair.ssh_key.key_name
  associate_public_ip_address = true
  tags = {
    Name = "${var.common_resource_name}_Bastion"
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo mkdir -p /home/ubuntu/.ssh
    echo "${local.ssh_private_key}" | sudo tee /home/ubuntu/.ssh/id_rsa
    sudo chmod 600 /home/ubuntu/.ssh/id_rsa
    sudo chown ubuntu:ubuntu /home/ubuntu/.ssh/id_rsa
  EOF
}

resource "aws_instance" "application" {
  ami           = "ami-053a617c6207ecc7b"
  instance_type = var.machine_data["type"]    
  subnet_id     = module.network_module.subnets["private_subnet_1"].id  
  vpc_security_group_ids = [aws_security_group.allow_ssh_and_3000.id]
  key_name      = aws_key_pair.ssh_key.key_name
  tags = {
    Name = "${var.common_resource_name}_Application Server"
  }
}
