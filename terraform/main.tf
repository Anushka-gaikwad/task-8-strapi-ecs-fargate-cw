terraform {
  backend "s3" {
    bucket  = "pearlthoughts-strapi-tfstate"
    key     = "sejal-fargate/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.region
}
