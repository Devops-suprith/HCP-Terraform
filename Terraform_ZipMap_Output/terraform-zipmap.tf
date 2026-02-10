provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "test_users" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "combined" {
    value = zipmap(aws_iam_user.test_users[*].name,aws_iam_user.test_users[*].arn)
}