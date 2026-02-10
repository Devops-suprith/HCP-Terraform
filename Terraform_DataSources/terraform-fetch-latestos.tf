provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "demoami" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "test_latest_ubuntu" {
  ami = data.aws_ami.demoami.image_id
  instance_type = "t2.micro"
}