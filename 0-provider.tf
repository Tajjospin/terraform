provider "aws" {
    region = var.AWS_REGION
    secret_key = var.AWS_SECRET_KEY
    access_key = var.AWS_ACCESS_KEY
  
}

terraform {
  cloud {
    organization = "anogo"

    workspaces {
      name = "terraform"
   #   name = "AWS_GRP_DAKAR"

    }
    
  }
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
    }
  }
}
