output "port" {
  value = "${aws_db_instance.example_prod.port}"
}

output "address" {
  value = "${aws_db_instance.example_prod.address}"
}