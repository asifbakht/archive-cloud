
resource "aws_lb_target_group" "target_group" {
  name        = "${var.aws_alb_tg_name}-${var.aws_archive_name}"
  port        = var.aws_alb_tg_port
  protocol    = var.aws_alb_tg_protocol
  target_type = var.aws_alb_tg_target_type
  vpc_id      = var.aws_alb_vpc_id # Referencing the default VPC
  health_check {
    matcher = "200,301,302"
    path    = "/"
  }
}
