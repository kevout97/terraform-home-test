data "aws_iam_policy_document" "task_assume_role" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

# Role to allow execute tasks
data "aws_iam_policy" "task_role_policy" {
  name = "AmazonECSTaskExecutionRolePolicy"
}