provider "aws" {
  region = "us-east-1"
}

locals {
  default-tags = {
    Team = "Payments-Team"
  }
}

variable "ami_id" {
  default = "ami-0ecb62995f68bb549"
}

resource "aws_instance" "locals_test" {
  ami = var.ami_id
  instance_type = "t2.micro"
  tags = local.default-tags
}