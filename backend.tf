terraform {
   backend "s3" {
     bucket         = "simple-proj-bk" 
     key            = "terraform.tfstate" 
     region         = "eu-west-2"
     encrypt        = true
     #dynamodb_table = "terraform-lock-dev"
   }
}
