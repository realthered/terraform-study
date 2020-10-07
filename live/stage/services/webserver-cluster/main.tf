provider "aws" {
  region = "ap-southeast-2"
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  ami = "ami-0f96495a064477ffb"
  server_text = "New server text"

  cluster_name = "webservers-stage"
  db_remote_state_bucket = "terraform-up-and-running-state-sjlee"
  db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size = 2
  max_size = 2
  enable_autoscaling = false
}
