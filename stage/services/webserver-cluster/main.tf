provider "aws" {
  region = "ap-southeast-2"
}

module "webserver_cluster" {
  source = "C:/Users/latyi/workspace/git/terraform-study/modules/services/webserver-cluster"

  cluster_name = "webserver-stage"
  db_remote_state_bucket = "terraform-up-and-running-state-sjlee"
  db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size = 2
  max_size = 2
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type = "ingress"
  security_group_id = module.webserver_cluster.elb_security_group_id

  from_port = 12345
  to_port = 12345
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}