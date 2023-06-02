variable "aws_region" {
  description = "AWS region for the infrastructure"
  type        = string
  default     = "us-east-1"
}

# variable "archive_ecr_repository_name" {
#   description = "Archive AWS ECR Repository Name"
#   type        = string
#   default     = "node-docker-ecs"
# }

variable "archive_ecs_cluster_name" {
  description = "Archive AWS ECS Cluster Name"
  type        = string
  default     = "archive-ecs-cluster"
}

# variable "archive_ecs_task_name" {
#   description = "Archive AWS ECS Task Name"
#   type        = string
#   default     = "archive-backend-task"
# }

# variable "archive_ecs_task_execution_iam_role_name" {
#   description = "Archive AWS ECS Task Execution IAM Role"
#   type        = string
#   default     = "ecsTaskExecutionRole"
# }

variable "aws_ecs_task_container_port" {
  description = "Archive AWS ECS Task Container Port"
  type        = number
  default     = 3000
}

variable "aws_ecs_task_host_port" {
  description = "Archive AWS ECS Task Host Port"
  type        = number
  default     = 3000
}

variable "aws_ecs_task_memory" {
  description = "Archive AWS ECS Task Memory"
  type        = number
  default     = 512
}

variable "aws_ecs_task_cpu" {
  description = "Archive AWS ECS Task CPU"
  type        = number
  default     = 256
}

# variable "archive_ecs_service_name" {
#   description = "Archive AWS ECS Service Name"
#   type        = string
#   default     = "archive-backend-service"
# }

variable "aws_alb_name" {
  description = "Archive AWS ALB Name"
  type        = string
  default     = "archive-ecs-lb"
}

variable "aws_default_subnets" {
  description = "Archive AWS Default Subnet A ID"
  type        = list(string)
  default     = []
}

variable "aws_sg_name" {
  description = "Archive AWS SG Name"
  type        = string
  default     = "archive-ecs-alb-sg"
}

variable "aws_sg_description" {
  description = "Archive AWS SG Description"
  type        = string
  default     = "Archive ECS SG"
}

variable "archive_sg_ingress_rules" {
  description = "Archive AWS SG Ingress Rules"
  type = map(object({
    description     = optional(string)
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
  }))
  default = {
    "rule1" = {
      description = "For HTTP"
      from_port   = 80 # Allowing traffic in from port 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # Allowing traffic in from all sources
    }
  }
}

variable "archive_sg_egress_rules" {
  description = "Archive AWS SG egress Rules"
  type = map(object({
    description     = optional(string)
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
  }))
  default = {
    "rule1" = {
      description = "Allow All Egress"
      from_port   = 0             # Allowing any incoming port
      to_port     = 0             # Allowing any outgoing port
      protocol    = "-1"          # Allowing any outgoing protocol 
      cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
    }
  }
}

variable "archive_alb_tg_name" {
  description = "Archive AWS ALB Target Group Name"
  type        = string
  default     = "archive-ecs-alb-tg"
}

variable "archive_alb_tg_port" {
  description = "Archive AWS ALB Target Group Port"
  type        = number
  default     = 80
}

variable "archive_alb_tg_protocol" {
  description = "Archive AWS ALB Target Group Protocol"
  type        = string
  default     = "HTTP"
}

variable "archive_alb_tg_target_type" {
  description = "Archive AWS ALB Target Group Target Type"
  type        = string
  default     = "ip"
}

variable "archive_alb_listener_port" {
  description = "Archive AWS ALB Listener Port"
  type        = string
  default     = "80"
}

variable "archive_alb_listener_protocol" {
  description = "Archive AWS ALB Listener Protocol"
  type        = string
  default     = "HTTP"
}

variable "archive_alb_listener_default_action_type" {
  description = "Archive AWS ALB Listener Default Action Type"
  type        = string
  default     = "forward"
}

# variable "archive_ecs_sg_name" {
#   description = "Archive ECS AWS SG Name"
#   type        = string
#   default     = "archive-ecs-service-sg"
# }

variable "archive_ecs_sg_description" {
  description = "Archive ECS AWS SG Description"
  type        = string
  default     = "Archive ECS Service SG"
}

variable "archive_ecs_sg_ingress_rules" {
  description = "Archive AWS SG Ingress Rules"
  type = map(object({
    description     = optional(string)
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
  }))
  default = {}
}

variable "archive_ecs_sg_egress_rules" {
  description = "Archive AWS SG egress Rules"
  type = map(object({
    description     = optional(string)
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
  }))
  default = {}
}

###############

variable "aws_alb_listener_priority" {
  description = "AWS ALB Listener Priority for specific archive service"
  type        = number
}

variable "aws_alb_listener_path" {
  description = "AWS ALB Listener Path for specific archive service"
  type        = string
}


variable "archive_alb_sg_id" {
  description = "Archive ALB SG ID"
  type        = string
  default     = ""
}



variable "archive_vpc_subnet" {
  description = "CDLE VPC subnet for archives"
  type = map
  default = {
    aws_default_subnet_a_id     = ""
    aws_default_subnet_b_id     = ""
    aws_default_subnet_c_id     = ""
    aws_default_subnet_d_id     = ""
  }
}

# variable "aws_secrets_manager_name" {
#   description = "AWS archive secrets manager"
#   type        = string
# }


# variable "aws_alb_vpc_id" {
#   description = "AWS vpc id"
#   type        = string
# }


variable "aws_alb_tg_name" {
  description = "AWS ALB Target Group Name"
  type        = string
}

variable "aws_alb_tg_port" {
  description = "AWS ALB Target Group Port"
  type        = number
}

variable "aws_alb_tg_protocol" {
  description = "AWS ALB Target Group Protocol"
  type        = string
}

variable "aws_alb_tg_target_type" {
  description = "AWS ALB Target Group Target Type"
  type        = string

  validation {
    condition     = contains(["instance", "ip", "lambda", "alb"], var.aws_alb_tg_target_type)
    error_message = "Allowed values for aws_alb_tg_target_type are \"instance\", \"ip\", \"lambda\", or \"alb\"."
  }
}

variable "aws_alb_vpc_id" {
  description = "AWS ALB VPC ID"
  type        = string
}

variable "aws_alb_listener_port" {
  description = "AWS ALB Listener Port"
  type        = string
}

variable "aws_alb_listener_protocol" {
  description = "AWS ALB Listener Protocol"
  type        = string
}

variable "aws_alb_listener_default_action_type" {
  description = "AWS ALB Listener Default Action Type"
  type        = string

  validation {
    condition     = contains(["forward", "redirect", "fixed-response", "authenticate-cognito", "authenticate-oidc"], var.aws_alb_listener_default_action_type)
    error_message = "Allowed values for aws_alb_listener_default_action_type are \"forward\", \"redirect\", \"fixed-response\", \"authenticate-cognito\" or \"authenticate-oidc\"."
  }
}


variable "aws_alb_arn" {
  description = "AWS ALB ARN"
  type        = string
}


variable "aws_alb_listener_arn" {
  description = "AWS ALB Listener ARN"
  type        = string
}



variable "aws_archive_name" {
  description = "AWS Archive name"
  type        = string
}



variable "aws_ecs_cluster_id" {
  description = "Archive AWS ALB Listener Default Action Type"
  type        = string
}
