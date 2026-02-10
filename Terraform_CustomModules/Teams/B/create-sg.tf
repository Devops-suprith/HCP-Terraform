provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias = "mumbai"
  region = "ap-south-1"
}

module "create_sg" {
  source = "../../Modules/SG"
  providers = {
    aws.prod = aws.mumbai
  }
}