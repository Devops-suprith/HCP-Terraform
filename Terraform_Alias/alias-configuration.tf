provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "ap-south-1"
  alias = "mumbia"
}

provider "aws" {
  alias = "singapore"
  region = "ap-southeast-1"
}

resource "aws_security_group" "sg1" {
  name = "production-group"
  provider = aws.mumbia
}

resource "aws_security_group" "sg2" {
  name = "staging-group"
  provider = aws.singapore
}