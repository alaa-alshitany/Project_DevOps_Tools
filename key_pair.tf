//tls generate 2 keys (public , private)
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA" 
  rsa_bits  = 2048  
}
//save private key to s3 bucket
resource "aws_s3_object" "private_key" {
  bucket = "lab2-env-bk "
  key    = "private_key.pem"
  content  = tls_private_key.ssh_key.private_key_pem   
}
//upload public key to s3 bucket 
resource "aws_s3_object" "public_key" {
  bucket = "lab2-env-bk "
  key_name   = "public_key.pub"  
  public_key = tls_private_key.ssh_key.public_key_openssh 
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "lab2-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}
