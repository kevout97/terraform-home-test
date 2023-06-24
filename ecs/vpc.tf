resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name        = "${var.ecs_name}-vpc"
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
    Name        = "${var.ecs_name}-ig"
    Environment = var.environment
  }
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    # We allow access to all network
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name        = "${var.ecs_name}"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "this" {
  for_each       = { for s in var.subnets : s.name => s }
  subnet_id      = aws_subnet.this[each.key].id
  route_table_id = aws_route_table.this.id
}
