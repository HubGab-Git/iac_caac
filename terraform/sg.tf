resource "aws_security_group" "bastion" {
  name        = "bastion_allow_ssh_for_instance"
  description = "Allow SSH inbound traffic for Instance"
  vpc_id      = module.vpc.vpc_id
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "database" {
  name        = "database_allow_from_bastion"
  description = "Allow db connection from bastion"
  vpc_id      = module.vpc.vpc_id
  ingress {
    description     = "Allow MySQL"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_mysql"
  }
}