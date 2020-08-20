provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app" {
  instance_type = "t2.micro"
  availability_zone = "us-west-2a"
  ami = "ami-0873b46c45c11058d"

  user_data = <<-EOF
              #!/bin/bash
              sudo service apache2 start
              EOF
}
