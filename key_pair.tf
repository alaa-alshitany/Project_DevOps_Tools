// TLS generate 2 keys (public, private)
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

// Save private key to S3 bucket
resource "aws_s3_object" "private_key" {
  bucket = "lab2-env-bk"
  key    = "private_key.pem"
  content  = tls_private_key.ssh_key.private_key_pem
}

// Upload public key to S3 bucket
resource "aws_s3_object" "public_key" {
  bucket = "lab2-env-bk"
  key    = "public_key.pub" 
  content = tls_private_key.ssh_key.public_key_openssh  
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "lab2-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}
