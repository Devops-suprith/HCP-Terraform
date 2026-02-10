variable "iam-user-names" {
  type = set(string)
  default = [ "Sumanth","Siva","Vinneesha C","Sunnetha" ]
}

variable "ec2-instance-ami" {
  type = map
  default = {
    prod = "ami-00032c95c343f8efb"
    stage = "ami-0020c2fa4cdf85dbd"
  }
}


