provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "dynamic_block_test" {
  name = "dynamic_block_test"
  dynamic "ingress" {
    for_each = var.ports_ingress
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = ingress.value
      protocol    = "tcp"
      to_port     = ingress.value
    }
  }
}