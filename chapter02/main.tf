provider "aws" {
  region = "us-west-2"
}

/*
// The first example
resource "aws_instance" "example" {
  ami = "ami-0a07be880014c7b8e"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform-example"
  }
}
*/

resource "aws_security_group" "instance" {
  name = var.security_group_name

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["67.175.68.34/32"]
  }
}

resource "aws_instance" "example" {
  ami                    = "ami-0a634ae95e11c6f91"
  instance_type          = "t2.micro"
  key_name = "physical-ssh-key"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
          #! /bin/bash
          echo "Hello, World" > index.html
          nohup busybox httpd -f -p 8080 &
  EOF

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_key_pair" "physical-ssh-key" {
  key_name = "physical-ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "terraform-example-instance"
}

output "public_ip" {
  value = aws_instance.example.public_ip
  description = "The public IP of the instance"
}
