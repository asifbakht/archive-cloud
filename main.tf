
module "cubsbackend_archive" {
  ###################### your archive project information start here ########################
  source                               = "./archive"
  aws_archive_name                     = "cubs-backend"
  aws_alb_listener_path                = "/cubs"
  aws_alb_listener_priority            = 1 # <---------------- must be unique across all archive modules
  ###################### your archive project information ends here  #########################
  
  aws_alb_arn                          = module.archive_ec2.aws_lb_arn
  aws_alb_listener_arn                 = module.archive_ec2.aws_lb_listener_arn
  aws_ecs_cluster_id                   = module.archive_ecs_cluster.aws_ecs_cluster_id
  archive_alb_sg_id                    = module.archive_alb_sg.aws_sg_id
  aws_alb_vpc_id                       = module.archive_vpc.aws_default_vpc_id
  aws_ecs_task_host_port               = var.aws_ecs_host_port
  aws_ecs_task_container_port          = var.aws_ecs_container_port
  aws_ecs_task_memory                  = var.aws_ecs_task_memory
  aws_ecs_task_cpu                     = var.aws_ecs_task_cpu
  archive_ecs_sg_ingress_rules         = var.archive_ecs_sg_ingress_rules
  archive_ecs_sg_egress_rules          = var.archive_ecs_sg_egress_rules
  aws_alb_tg_name                      = var.archive_alb_tg_name
  aws_alb_tg_port                      = var.archive_alb_tg_port
  aws_alb_tg_protocol                  = var.archive_alb_tg_protocol
  aws_alb_tg_target_type               = var.archive_alb_tg_target_type
  aws_alb_listener_port                = var.archive_alb_listener_port
  aws_alb_listener_protocol            = var.archive_alb_listener_protocol
  aws_alb_listener_default_action_type = var.archive_alb_listener_default_action_type
  archive_vpc_subnet = {
    aws_default_subnet_a_id = "${module.archive_vpc.aws_default_subnet_a_id}"
    aws_default_subnet_b_id = "${module.archive_vpc.aws_default_subnet_b_id}"
    aws_default_subnet_c_id = "${module.archive_vpc.aws_default_subnet_c_id}"
    aws_default_subnet_d_id = "${module.archive_vpc.aws_default_subnet_d_id}"
  }
  depends_on = [module.archive_ec2]
}

module "archive_ecs_cluster" {
  source               = "./modules/ecs"
  aws_ecs_cluster_name = var.archive_ecs_cluster_name
}

module "archive_vpc" {
  source = "./modules/vpc"
}


module "archive_alb_sg" {
  source               = "./modules/sg"
  aws_sg_name          = var.aws_sg_name
  aws_sg_description   = var.aws_sg_description
  aws_sg_ingress_rules = var.archive_sg_ingress_rules
  aws_sg_egress_rules  = var.archive_sg_egress_rules
}

module "archive_ec2" {
  source                               = "./modules/alb"
  aws_alb_name                         = var.aws_alb_name
  aws_default_subnets                  = ["${module.archive_vpc.aws_default_subnet_a_id}", "${module.archive_vpc.aws_default_subnet_b_id}", "${module.archive_vpc.aws_default_subnet_c_id}", "${module.archive_vpc.aws_default_subnet_d_id}"]
  aws_alb_listener_port                = var.archive_alb_listener_port
  aws_alb_listener_protocol            = var.archive_alb_listener_protocol
  aws_alb_listener_default_action_type = var.archive_alb_listener_default_action_type
  aws_alb_sg_id                        = module.archive_alb_sg.aws_sg_id
  depends_on                           = [module.archive_vpc, module.archive_alb_sg]
}
