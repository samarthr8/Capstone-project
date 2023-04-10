terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.51.0"
    }
  }
  backend "s3" {
    bucket         = "capstone-terraform"
    key            = "state/terraform.state"
    region         = "us-east-1"
  }
}


provider "aws" {

  region = "us-east-1"

}
