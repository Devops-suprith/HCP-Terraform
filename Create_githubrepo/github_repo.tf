terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {

}

resource "github_repository" "terraform_test" {
  name        = "terraform_test"
  description = "My awesome codebase"
  visibility = "private"
  
  lifecycle {
    ignore_changes = [
      allow_forking
    ]
  }

}