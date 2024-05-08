# terraform {
#   backend "s3" {
#     bucket         = "lab2-env-bk" 
#     key            = "terraform.tfstate" 
#     region         = "eu-west-1"
#     encrypt        = true
#     dynamodb_table = "terraform-lock-dev"
#   }
# }