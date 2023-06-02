variable "archive_ecs_cluster_name" {
  description = "Archive AWS ECS Cluster Name"
  type        = string
  default     = "archive-ecs-cluster"
}


variable "aws_ecs_host_port" {
  description = "Archive AWS ECS Host Port"
  type        = number
  default     = 3333
}

variable "aws_ecs_container_port" {
  description = "Archive AWS ECS Container Port"
  type        = number
  default     = 3333
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


variable "aws_alb_name" {
  description = "Archive AWS ALB Name"
  type        = string
  default     = "archive-ecs-lb"
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