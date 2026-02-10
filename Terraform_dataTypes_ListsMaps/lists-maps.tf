provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "datatypes_test" {
  ami = "ami-0ecb62995f68bb549"
  instance_type = var.map_example["us-east-1"]
}