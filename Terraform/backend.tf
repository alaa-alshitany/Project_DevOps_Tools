terraform {
   backend "s3" {
     bucket         = "simple-project-bk" 
     key            = "terraform.tfstate" 
     region         = "eu-west-1"
     encrypt        = true
     dynamodb_table = "simple-proj-tb"
   }
}
