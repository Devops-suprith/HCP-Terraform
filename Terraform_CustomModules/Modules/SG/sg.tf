terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 6.28.0"
      configuration_aliases = [ aws.prod ]
    }
  }
}

resource "aws_security_group" "prod" {
  name = "prod-sg"
  provider = aws.prod
}

resource "aws_security_group" "stage" {
  name = "stage-sg"
}