provider "aws" {
  region = "ap-southeast-2"
}

terraform{
  backend "s3" {
    bucket = "terraform-up-and-running-state-sjlee"
    key = "prod/data-stores/mysql/terraform.tfstate"
    region = "ap-southeast-2"
    encrypt = true
    #dynamodb_table = "terraform-up-and-running-lock"
  }
}

resource "aws_db_instance" "example_prod" {
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  name = "example_database_prod"
  username = "admin"
  password = "var.db_password"
  skip_final_snapshot = true
}
