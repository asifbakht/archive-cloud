resource "aws_ecs_task_definition" "aws_ecs_task" {
  family                   = var.aws_ecs_task_name # Naming our first task
  container_definitions    = <<DEFINITION
  [
    {
      "name": "${var.aws_ecs_task_name}",
      "image": "${var.aws_ecr_repository_url}",
      "essential": true,
      "portMappings": [
        {
          "containerPort": ${var.aws_ecs_task_container_port},
          "hostPort": ${var.aws_ecs_task_host_port}
        }
      ],
      "memory": ${var.aws_ecs_task_memory},
      "cpu": ${var.aws_ecs_task_cpu}
    }
  ]
  DEFINITION
  requires_compatibilities = ["FARGATE"]             # Stating that we are using ECS Fargate
  network_mode             = "awsvpc"                # Using awsvpc as our network mode as this is required for Fargate
  memory                   = var.aws_ecs_task_memory # Specifying the memory our container requires
  cpu                      = var.aws_ecs_task_cpu    # Specifying the CPU our container requires
  execution_role_arn       = var.aws_ecs_task_execution_iam_role_arn
}



# resource "aws_ecs_task_definition" "aws_ecs_task" {
#   family                   = var.aws_ecs_task_name # Naming our first task
#   container_definitions    = <<DEFINITION
#   [
#     {
#       "name": "${var.aws_ecs_task_name}",
#       "image": "${var.aws_ecr_repository_url}",
#       "essential": true,
#       "portMappings": [
#         {
#           "containerPort": ${var.aws_ecs_task_container_port},
#           "hostPort": ${var.aws_ecs_task_host_port}
#         }
#       ],
#       "memory": ${var.aws_ecs_task_memory},
#       "cpu": ${var.aws_ecs_task_cpu},
#       "secrets":[
#         {
#           "valueFrom": "${var.aws_secrets_manager_arn}",
#           "name": "${var.aws_secrets_name_definition}"
#         }
#       ]
#     }
#   ]
#   DEFINITION
#   requires_compatibilities = ["FARGATE"]             # Stating that we are using ECS Fargate
#   network_mode             = "awsvpc"                # Using awsvpc as our network mode as this is required for Fargate
#   memory                   = var.aws_ecs_task_memory # Specifying the memory our container requires
#   cpu                      = var.aws_ecs_task_cpu    # Specifying the CPU our container requires
#   execution_role_arn       = var.aws_ecs_task_execution_iam_role_arn
# }
