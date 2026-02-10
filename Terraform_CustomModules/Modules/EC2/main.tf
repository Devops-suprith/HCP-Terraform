terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 6.28.0"
    }
  }
}

resource "aws_instance" "myec2_module" {
  ami = var.ami_id
  instance_type = var.instance_type
}

output "instance_id" {
  value = aws_instance.myec2_module.id
}