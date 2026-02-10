resource "aws_security_group" "remotestatesg" {
  name = "remotestatesg"
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  security_group_id = aws_security_group.remotestatesg.id

  cidr_ipv4   = "${data.terraform_remote_state.vpc.outputs.public_ips}/32"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}