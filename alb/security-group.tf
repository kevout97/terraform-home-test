resource "aws_security_group" "this" {
  name        = "${var.alb_name}-security-group"
  description = "Allow inbound traffic"

  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}