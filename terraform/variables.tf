variable "region" {
  type        = string
  description = "Region where should EC2 and RDS will be placed"
}

variable "ec2_name" {
  type        = string
  description = "Name of EC2 instance"
}

variable "instance_type" {
  type        = string
  default     = "t3.nano"
  description = "Instance type for EC2 instance"
}

variable "ami" {
  type        = string
  default     = "ami-01cae1550c0adea9c"
  description = "AWS linux 2 instance"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR of VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets cidrs in VPC"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets cidrs in VPC"
}

variable "azs" {
  type        = list(string)
  description = "List of AZ where should be instance"
}