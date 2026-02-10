provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "foreachmap" {
  for_each = var.ec2-instance-ami
  ami = each.value
  instance_type = "t2.micro"

  tags = {
    name = each.key
  }
}