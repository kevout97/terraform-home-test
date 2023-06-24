variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "aws_profile" {
  type        = string
  description = "AWS Profile"
}

variable "ecs_name" {
  type        = string
  description = "Ecs name"
}

variable "environment" {
  type        = string
  description = "Environment"
}

variable "subnets" {
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
  description = "Subnets definition"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
}
