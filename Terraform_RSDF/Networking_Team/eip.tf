resource "aws_eip" "testeip" {
  domain = "vpc"
}

output "public_ips" {
  value = aws_eip.testeip.public_ip
}