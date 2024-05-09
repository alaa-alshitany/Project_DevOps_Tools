resource "aws_s3_bucket" "bucket" {
  bucket = "simple-proj-bk"
  acl    = "private"        
  region = "$var.region"   
}
