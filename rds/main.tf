resource "aws_db_subnet_group" "this" {
  name       = "${var.rds_name}-subnet-group"
  subnet_ids = [for s in aws_subnet.this : s.id]

  tags = {
    Name = "${var.rds_name}-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  identifier             = "${var.rds_name}-instance"
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.this.id]

  publicly_accessible = true # It allows to access from Internet, however for production environments please don't do that.

  tags = {
    Name = "${var.rds_name}-instance"
  }
}
