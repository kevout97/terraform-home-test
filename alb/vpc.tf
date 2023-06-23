resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name        = "${var.alb_name}-vpc"
    Environment = var.environment
  }
}

resource "aws_subnet" "this" {
  for_each          = { for s in var.subnets : s.name => s }
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name        = each.key
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.alb_name}-ig"
    Environment = var.environment
  }
}
