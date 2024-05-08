terraform {
   backend "s3" {
     bucket         = "lab2-env-bk" 
     key            = "terraform.tfstate" 
     region         = "eu-west-2"
     encrypt        = true
     #dynamodb_table = "terraform-lock-dev"
   }
}
