provider "aws" {
    region = var.AWS_REGION
  
}

terraform {
  cloud {
    organization = "anogo"

   # workspaces {
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
