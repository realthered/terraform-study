provider "aws" {
  region = "ap-southeast-2"
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