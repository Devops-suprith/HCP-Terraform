provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "conditionstest" {
  ami = "ami-0ecb62995f68bb549"
  instance_type = var.Environment == "Production" && var.region_test == "us-east-1"?"t2.micro":"t2.small"
}