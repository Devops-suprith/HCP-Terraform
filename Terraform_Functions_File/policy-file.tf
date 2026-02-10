provider "aws" {
    region = "us-east-1" 
}

resource "aws_iam_user" "this" {
  name = "Suprith-test"
}

resource "aws_iam_user_policy" "test_policy" {
  name = "demo-user-policy"
  user = aws_iam_user.this.name

  policy = file("./user-policy.json")
}