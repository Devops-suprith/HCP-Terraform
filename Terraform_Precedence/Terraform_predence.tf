provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "preceedence_example" {
  ami = "ami-0ecb62995f68bb549"
  instance_type = var.instance
}