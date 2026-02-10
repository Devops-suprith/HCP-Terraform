module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.2.0"
  subnet_id = "subnet-00d2d59132b106617"
}