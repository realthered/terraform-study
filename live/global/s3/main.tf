provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-sjlee"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "ap-southeast-2"
    encrypt = true
    #dynamodb_table = "terraform-up-and-running-lock"
  }
}


resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-state-sjlee"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}