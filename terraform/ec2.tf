resource "aws_instance" "bastion" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  key_name                    = var.ec2_name
  associate_public_ip_address = true
  tags = {
    Name = var.ec2_name
  }
  depends_on = [
    module.vpc
  ]
}