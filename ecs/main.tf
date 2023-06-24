resource "aws_ecs_cluster" "this" {
  name = var.ecs_name
}

resource "aws_ecs_task_definition" "this" {
  family = "${var.ecs_name}-task" # Naming our first task
  container_definitions = jsonencode(
    [
      {
        "name" : "terraform-local-test-task",
        "image" : "nginx:latest",
        "essential" : true,
        "portMappings" : [
          {
            "containerPort" : 80,
            "hostPort" : 80
          }
        ],
        "memory" : 512,
        "cpu" : 256
      }
    ]
  )
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = 512
  cpu                      = 256
  execution_role_arn       = aws_iam_role.task_iam_role.arn
}

resource "aws_ecs_service" "this" {
  name            = "${var.ecs_name}-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name   = aws_ecs_task_definition.this.family
    container_port   = 80
  }

  network_configuration {
    subnets          = [for s in aws_subnet.this : s.id]
    assign_public_ip = true
    security_groups  = [aws_security_group.service_security_group.id]
  }
}
