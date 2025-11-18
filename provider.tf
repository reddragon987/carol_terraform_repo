terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "6.21.0"
      }
    }
    backend "s3" {
      bucket = "carols-training-bucket"
      key = "devc/carol/terraform.tfstate"
      encrypt = true
      region = "us-east-1"
      dynamodb_table = "carols_table"
    }
}

provider "aws" {
    #Configuration options
  region = var.my_aws_region
  }