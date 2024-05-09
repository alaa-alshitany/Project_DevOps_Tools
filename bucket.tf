resource "aws_s3_bucket_acl" "bucket" {
  bucket = "simple-proj-bk"
  acl    = "private"        
  region = var.region   
}
