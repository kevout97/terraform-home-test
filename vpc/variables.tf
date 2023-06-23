variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "aws_profile" {
  type        = string
  description = "AWS Profile"
}

variable "environment" {
  type        = string
  description = "Environment"
}

variable "subnet_cidr_block" {
  type        = string
  description = "Subnet CIDR block"
}

variable "subnet_az" {
  type        = string
  description = "Subnet availability zone"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
}

variable "vpc_name" {
  type        = string
  description = "VPC name"
}
