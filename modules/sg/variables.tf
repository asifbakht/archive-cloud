variable "aws_sg_name" {
  description = "AWS SG Name"
  type        = string
}

variable "aws_sg_description" {
  description = "AWS SG Description"
  type        = string
}


variable "aws_sg_ingress_rules" {
  description = "AWS SG Ingress Rules"
  type = map(object({
    description     = optional(string)
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
  }))
}

variable "aws_sg_egress_rules" {
  description = "AWS SG egress Rules"
  type = map(object({
    description     = optional(string)
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
  }))
}
