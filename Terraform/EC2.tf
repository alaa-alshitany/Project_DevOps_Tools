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
    echo '${tls_private_key.ssh_key.private_key_pem}' > /home/ubuntu/key.pem
    chmod 400 /home/ubuntu/key.pem
    chown ubuntu:ubuntu /home/ubuntu/key.pem
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
