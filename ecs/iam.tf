resource "aws_iam_role" "task_iam_role" {
  name               = "${var.ecs_name}-iam-role"
  assume_role_policy = data.aws_iam_policy_document.task_assume_role.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.task_iam_role.name
  policy_arn = data.aws_iam_policy.task_role_policy.arn
}
