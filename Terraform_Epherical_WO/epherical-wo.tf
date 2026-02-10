provider "aws" {
  region = "us-east-1"
}

ephemeral "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "test_ephermeral" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password_wo          = ephemeral.random_password.password.result
  password_wo_version  = 1
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

resource "aws_secretsmanager_secret" "dbpassword" {
  name = "db_pass"
}

resource "aws_secretsmanager_secret_version" "dbpassword" {
  secret_id = aws_secretsmanager_secret.dbpassword.id
  secret_string_wo = ephemeral.random_password.password.result
  secret_string_wo_version = 1
}

ephemeral "aws_secretsmanager_secret_version" "dbpassword" {
  secret_id = aws_secretsmanager_secret_version.dbpassword.secret_id
}