resource "aws_alb" "this" {
  name               = "${var.ecs_name}-alb"
  load_balancer_type = "application"
  subnets            = [for s in aws_subnet.this : s.id] # At least two subnets in two differents AZ
  security_groups = [aws_security_group.load_balancer_security_group.id]
}

resource "aws_lb_target_group" "this" {
  name        = "target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.this.id
  health_check {
    matcher = "200,301,302"
    path    = "/"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.this.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
