
# VPC where EKS will be placed
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.18.1"
  name = "bastion_database"
  cidr                 = var.vpc_cidr
  public_subnets       = var.public_subnets
  database_subnets     = var.private_subnets
  azs                  = var.azs
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
}