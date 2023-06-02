module "archive_ecr_repository" {
  source                  = "../modules/ecr"
  aws_ecr_repository_name = "${var.aws_archive_name}-repository"
}

module "archive_iam" {
  source                               = "../modules/iam"
  aws_ecs_task_execution_iam_role_name = "${var.aws_archive_name}-EcsTaskExecutionRole"
}

module "archive_alb_target_group" {
  source                 = "../modules/alb-targetgroup"
  aws_alb_tg_name        = var.archive_alb_tg_name
  aws_alb_tg_port        = var.archive_alb_tg_port
  aws_alb_tg_protocol    = var.archive_alb_tg_protocol
  aws_alb_tg_target_type = var.archive_alb_tg_target_type
  aws_archive_name       = var.aws_archive_name
  aws_alb_vpc_id         = var.aws_alb_vpc_id
}


module "archive_alb_listener_rule" {
  source                               = "../modules/alb-listener"
  aws_alb_arn                          = var.aws_alb_arn
  aws_alb_listener_arn                 = var.aws_alb_listener_arn
  aws_alb_listener_path                = var.aws_alb_listener_path
  aws_alb_listener_priority            = var.aws_alb_listener_priority
  aws_alb_listener_port                = var.archive_alb_listener_port
  aws_alb_listener_protocol            = var.archive_alb_listener_protocol
  aws_alb_listener_default_action_type = var.archive_alb_listener_default_action_type
  aws_alb_target_group_arn             = module.archive_alb_target_group.aws_lb_target_group_arn
}

module "archive_ecs_task_definition" {
  source                              = "../modules/ecs-task-definition"
  aws_ecs_task_name                   = "${var.aws_archive_name}-task"
  aws_ecr_repository_url              = module.archive_ecr_repository.aws_ecr_repository_url
  aws_ecs_task_container_port         = var.aws_ecs_task_container_port
  aws_ecs_task_host_port              = var.aws_ecs_task_host_port
  aws_ecs_task_memory                 = var.aws_ecs_task_memory
  aws_ecs_task_cpu                    = var.aws_ecs_task_cpu
  aws_ecs_task_execution_iam_role_arn = module.archive_iam.aws_ecs_iam_execution_role_arn
  # aws_secrets_manager_arn             = module.secrets_manager.mysql_secrets_manager
  aws_secrets_manager_arn     = "removeit"
  aws_secrets_name_definition = "${var.aws_archive_name}-definition"
  depends_on                  = [module.archive_ecr_repository, module.archive_iam, module.secrets_manager]
}

module "secrets_manager" {
  source                   = "../modules/secretsmanager"
  aws_secrets_manager_name = "${var.aws_archive_name}-rds-credentials-sm"
}



module "archive_ecs_sg" {
  source             = "../modules/sg"
  aws_sg_name        = "${var.aws_archive_name}-ecs-sg"
  aws_sg_description = "${var.aws_archive_name} ECS Service SG"
  aws_sg_ingress_rules = {
    "rule1" = {
      description     = "Allow All Ingress"
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      security_groups = ["${var.archive_alb_sg_id}"]
    }
  }
  aws_sg_egress_rules = {
    "rule1" = {
      description = "Allow All Egress"
      from_port   = 0             # Allowing any incoming port
      to_port     = 0             # Allowing any outgoing port
      protocol    = "-1"          # Allowing any outgoing protocol 
      cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
    }
  }
}

module "archive_ecs_service" {
  source                                        = "../modules/ecs-service"
  aws_ecs_service_name                          = "${var.aws_archive_name}-service"
  aws_ecs_cluster_id                            = var.aws_ecs_cluster_id
  aws_ecs_task_definition_arn                   = module.archive_ecs_task_definition.aws_ecs_task_definition_task_arn
  aws_ecs_service_lb_target_group_arn           = module.archive_alb_target_group.aws_lb_target_group_arn
  aws_ecs_service_lb_task_definition_family     = module.archive_ecs_task_definition.aws_ecs_task_definition_task_family
  aws_ecs_service_lb_task_container_port        = var.aws_ecs_task_container_port
  aws_ecs_service_network_configuration_subnets = ["${var.archive_vpc_subnet.aws_default_subnet_a_id}", "${var.archive_vpc_subnet.aws_default_subnet_b_id}", "${var.archive_vpc_subnet.aws_default_subnet_c_id}", "${var.archive_vpc_subnet.aws_default_subnet_d_id}"]
  aws_ecs_service_sg_id                         = module.archive_ecs_sg.aws_sg_id
  depends_on                                    = [module.archive_ecs_task_definition, module.archive_ecs_sg]
}




