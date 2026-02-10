data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    key = "datastate.tfstate"
    bucket = "awss3statedemo007"
    region = "us-east-1"    
  }
}