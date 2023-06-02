variable "aws_ecs_service_name" {
  description = "AWS ECS Service Name"
  type        = string
}

variable "aws_ecs_cluster_id" {
  description = "AWS ECS Cluster ID"
  type        = string
}

variable "aws_ecs_task_definition_arn" {
  description = "AWS ECS Task Definition ARN"
  type        = string
}

variable "aws_ecs_service_network_configuration_subnets" {
  description = "AWS ECS Service Network Configuration Subnets"
  type        = list(string)
}

variable "aws_ecs_service_lb_target_group_arn" {
  description = "AWS ECS Service Load Balancer Target Group ARN"
  type        = string
}

variable "aws_ecs_service_lb_task_definition_family" {
  description = "AWS ECS Task Definition Family"
  type        = string
}

variable "aws_ecs_service_lb_task_container_port" {
  description = "AWS ECS Task Container Port"
  type        = number
}

variable "aws_ecs_service_sg_id" {
  description = "AWS ECS Service Security Group ID"
  type        = string
}
