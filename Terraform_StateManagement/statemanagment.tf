terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.28.0"
    }
  }

  backend "s3" {
    bucket = "awss3statedemo007"
    key = "statemanagment.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "statemanagment" {
  name = "statemanagment"
}

resource "aws_security_group" "testsgstate" {
  name = "testsgstate"
}