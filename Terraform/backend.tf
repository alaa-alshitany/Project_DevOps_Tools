terraform {
   backend "s3" {
     bucket         = "simple-project-bk" 
     key            = "terraform.tfstate" 
     region         = "eu-west-2"
     encrypt        = true
     dynamodb_table = "simple-proj-tb"
   }
}
