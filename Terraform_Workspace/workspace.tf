provider "aws" {
  region = "us-east-1"
}

locals {
  instance_type={
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "m5.large"
  }
}

resource "aws_instance" "workspace_test" {
  ami = "ami-0ecb62995f68bb549"
  instance_type = local.instance_type[terraform.workspace]
}