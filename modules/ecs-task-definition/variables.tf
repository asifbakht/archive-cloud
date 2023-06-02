variable "aws_ecs_task_name" {
  description = "AWS ECS Task Name"
  type        = string
}

variable "aws_ecr_repository_url" {
  description = "AWS ECR Repository URL"
  type        = string
}

variable "aws_ecs_task_container_port" {
  description = "AWS ECS Task Container Port"
  type        = number
}

variable "aws_ecs_task_host_port" {
  description = "AWS ECS Task Host Port"
  type        = number
}

variable "aws_ecs_task_memory" {
  description = "AWS ECS Task Memory"
  type        = number
}

variable "aws_ecs_task_cpu" {
  description = "AWS ECS Task CPU"
  type        = number
}

variable "aws_ecs_task_execution_iam_role_arn" {
  description = "AWS ECS Task Execution IAM Role ARN"
  type        = string
}

variable "aws_secrets_manager_arn" {
  description = "AWS archive RDS secrets manager arn"
  type        = string
}


variable "aws_secrets_name_definition" {
  description = "AWS archive secrets manager name definition"
  type        = string
}



