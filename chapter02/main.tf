provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami = "ami-0a07be880014c7b8e"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform-example"
  }
}
