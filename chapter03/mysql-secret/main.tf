provider "aws" {
  region = "us-west-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  username = "admin"
  name = var.db_name
  skip_final_snapshot = true
  password = var.db_password
}
