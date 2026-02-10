terraform {
  backend "s3" {
    key = "datastate.tfstate"
    bucket = "awss3statedemo007"
    region = "us-east-1"
  }
}