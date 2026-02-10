provider "aws" {
  region = "ap-south-1"
}

module "ec2" {
  source = "../../Modules/EC2"
  ami_id = "ami-0ff5003538b60d5ec"
  instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  domain = "vpc"
  instance = module.ec2.instance_id
}