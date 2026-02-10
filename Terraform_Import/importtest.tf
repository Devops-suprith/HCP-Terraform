provider "aws" {
  region = "us-east-1"
}

import {
  to = aws_security_group.mysg
  id = "sg-0209ed826d20a3eac" 
}