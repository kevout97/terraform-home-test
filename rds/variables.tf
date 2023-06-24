variable "allocated_storage" {
  type        = number
  description = "Store size."
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "aws_profile" {
  type        = string
  description = "AWS Profile"
}

variable "db_name" {
  type        = string
  description = "DB name."
}

variable "db_username" {
  type        = string
  description = "DB username."
}

variable "db_password" {
  type        = string
  description = "DB password."
}

variable "engine" {
  type        = string
  description = "Engine type. Mysql, Postgres."
}

variable "engine_version" {
  type        = number
  description = "Engine version."
}

variable "environment" {
  type        = string
  description = "Environment"
}

variable "instance_class" {
  type        = string
  description = "Instance type."
}

variable "rds_name" {
  type        = string
  description = "Ecs name"
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