variable "aws_alb_name" {
  description = "AWS ALB Name"
  type        = string
}

variable "aws_default_subnets" {
  description = "AWS Default Subnet A ID"
  type        = list(string)
}


variable "aws_alb_sg_id" {
  description = "AWS ALB Security Group ID"
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