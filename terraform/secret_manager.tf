data "aws_secretsmanager_secret" "password" {
  name = "db_password"
}

data "aws_secretsmanager_secret_version" "password" {
  secret_id = data.aws_secretsmanager_secret.password.id
}