provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "cr_ip" {
  
}

resource "aws_security_group" "cr_allow_tls" {
    name        = "allow_tls"
    description = "Allow TLS inbound traffic and all outbound traffic"
    tags = {
        Name = "allow_tls"
    }
}

resource "aws_vpc_security_group_ingress_rule" "cr_allow_tls_ipv4" {
  security_group_id = aws_security_group.cr_allow_tls.id
  cidr_ipv4         = "${aws_eip.cr_ip.public_ip}/32"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

output "public_ip" {
  value = aws_eip.cr_ip.public_ip
}