provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "payment-database-firewall" {
  name = "db-firewall"
}

moved {
  from = aws_security_group.database-firewall
  to = aws_security_group.payment-database-firewall
}