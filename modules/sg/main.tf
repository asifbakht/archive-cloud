resource "aws_security_group" "security_group" {
  name        = var.aws_sg_name
  description = var.aws_sg_description

  dynamic "ingress" {
    for_each = var.aws_sg_ingress_rules
    content {
      description     = lookup(ingress.value, "description", null)
      from_port       = lookup(ingress.value, "from_port", null)
      to_port         = lookup(ingress.value, "to_port", null)
      protocol        = lookup(ingress.value, "protocol", null)
      cidr_blocks     = lookup(ingress.value, "cidr_blocks", null) == null ? null : lookup(ingress.value, "cidr_blocks", null)
      security_groups = lookup(ingress.value, "security_groups", null) == null ? null : lookup(ingress.value, "security_groups", null)
    }
  }

  dynamic "egress" {
    for_each = var.aws_sg_egress_rules
    content {
      description     = lookup(egress.value, "description", null)
      from_port       = lookup(egress.value, "from_port", null)
      to_port         = lookup(egress.value, "to_port", null)
      protocol        = lookup(egress.value, "protocol", null)
      cidr_blocks     = lookup(egress.value, "cidr_blocks", null) == null ? null : lookup(egress.value, "cidr_blocks", null)
      security_groups = lookup(egress.value, "security_groups", null) == null ? null : lookup(egress.value, "security_groups", null)
    }
  }
}
