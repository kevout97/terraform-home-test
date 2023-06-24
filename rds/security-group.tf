resource "aws_security_group" "this" {
  name        = "${var.rds_name}-security-group"
  description = "Allow inbound traffic"

  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
