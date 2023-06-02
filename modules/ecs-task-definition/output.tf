output "aws_ecs_task_definition_task_arn" {
  value = aws_ecs_task_definition.aws_ecs_task.arn
}

output "aws_ecs_task_definition_task_family" {
  value = aws_ecs_task_definition.aws_ecs_task.family
}
