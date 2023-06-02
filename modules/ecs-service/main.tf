resource "aws_ecs_service" "ecs_service" {
  name            = var.aws_ecs_service_name        # Naming our first service
  cluster         = var.aws_ecs_cluster_id          # Referencing our created Cluster
  task_definition = var.aws_ecs_task_definition_arn # Referencing the task our service will spin up
  launch_type     = "FARGATE"
  desired_count   = 1 # Setting the number of containers we want deployed to 3

  load_balancer {
    target_group_arn = var.aws_ecs_service_lb_target_group_arn # Referencing our target group
    container_name   = var.aws_ecs_service_lb_task_definition_family
    container_port   = var.aws_ecs_service_lb_task_container_port # Specifying the container port
  }

  network_configuration {
    subnets          = var.aws_ecs_service_network_configuration_subnets
    assign_public_ip = true                             # Providing our containers with public IPs
    security_groups  = ["${var.aws_ecs_service_sg_id}"] # Setting the security group
  }
}
