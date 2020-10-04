provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  backend "s3" {
    bucket  = "terraform-up-and-running-state-sjlee"
    key      = "terraform.tfstate"
    region  = "ap-southeast-2"
    encrypt = true
    dynamodb_table = "terraform-up-and-running-lock"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name = "terraform-up-and-running-lock"
  hash_key = "LockID"
  read_capacity = 2
  write_capacity = 2

  attribute {
    name = "LockID"
    type = "S"
  }
}