// TLS generate 2 keys (public, private)
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

//save private key locally
resource "local_file" "private_key" {
  filename = "${path.module}/key.pem"  
  content  = tls_private_key.ssh_key.private_key_pem  
  file_permission = "0600"  
}

//upload public key to aws 
resource "aws_key_pair" "ssh_key" {
  key_name   = "key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "null_resource" "print_private_key" {
  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_key.private_key_pem}'"
  }
}


output "public_key_openssh" {
  description = "The public key generated for SSH access."
  value       = tls_private_key.ssh_key.public_key_openssh
}
