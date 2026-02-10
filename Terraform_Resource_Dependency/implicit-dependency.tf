provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "implicit_ec2" {
  ami = "ami-0532be01f26a3de55"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.implicit_group.id]
}

resource "aws_security_group" "implicit_group" {
  name = "implicit_security_group"
}