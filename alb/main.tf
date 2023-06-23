resource "aws_lb" "this" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"                     # I know is quite redundant because is the default value
  subnets            = [for s in aws_subnet.this : s.id] # At least two subnets in two differents AZ
  security_groups    = [aws_security_group.this.id]
  tags = {
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "this" {
  name     = "${var.alb_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.this.id

  health_check {
    path = "/health"
  }
  tags = {
    Environment = var.environment
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
  tags = {
    Environment = var.environment
  }
}
