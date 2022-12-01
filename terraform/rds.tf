resource "aws_db_instance" "database" {
  allocated_storage = 10
  db_name           = "main"
  engine            = "mysql"
  #   engine_version       = "8.0.31"
  instance_class = "db.t3.micro"
  username       = "admin"
  password       = data.aws_secretsmanager_secret_version.password.secret_string
  #   parameter_group_name = "default.mysql5.7"
  skip_final_snapshot    = true
  availability_zone      = var.azs[0]
  db_subnet_group_name   = module.vpc.database_subnet_group_name
  vpc_security_group_ids = [aws_security_group.database.id]
  depends_on = [
    module.vpc
  ]
}