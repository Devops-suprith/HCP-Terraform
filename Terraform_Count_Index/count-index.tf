provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myfirstec2" {
  ami = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"
  count = 3

  tags = {
    Name = var.aws_instance_names[count.index] 
  }
}

resource "aws_iam_user" "lb" {
  name = var.aws_iam_names[count.index]
  count = 3
}