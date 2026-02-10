provider "aws" {
  region = "us-east-1"
}

variable "instance_type" {}

data "aws_ec2_instance_type" "example" {
  instance_type = var.instance_type
}

resource "aws_instance" "preposttest" {
  ami = "ami-0b6c6ebed2801a5cb"
  instance_type = var.instance_type

  lifecycle {
    precondition {
      condition = data.aws_ec2_instance_type.example.free_tier_eligible
      error_message = "Should create Ec2 Instance from Free Tier Eligible"
    }

    postcondition {
      condition = self.public_ip == ""
      error_message = "Public IP Should now be present"
    }
  }
}