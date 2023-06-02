
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




variable "aws_archive_name" {
  description = "AWS Archive name"
  type        = string
}
