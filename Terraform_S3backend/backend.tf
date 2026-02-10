terraform {
  backend "s3" {
    bucket = "suprith-s3-backend"
    key    = "production.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}