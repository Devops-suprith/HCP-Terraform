provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"
  description = "Security Group to allow HTTP, SSH & FTP"
}

resource "aws_vpc_security_group_ingress_rule" "http_ip" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4   = var.vpn_ip
  from_port   = var.http_ip
  ip_protocol = "tcp"
  to_port     = var.http_ip
}

resource "aws_vpc_security_group_ingress_rule" "ssh_ip" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4   = var.vpn_ip
  from_port   = var.ssh_ip
  ip_protocol = "tcp"
  to_port     = var.ssh_ip
}

resource "aws_vpc_security_group_ingress_rule" "ftp_ip" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4   = var.vpn_ip
  from_port   = var.ftp_ip
  ip_protocol = "tcp"
  to_port     = var.ftp_ip
}