
# resource "aws_lb_listener" "listener" {
#   load_balancer_arn = var.aws_alb_arn # Referencing our load balancer
#   port              = var.aws_alb_listener_port
#   protocol          = var.aws_alb_listener_protocol
#   default_action {
#     type             = var.aws_alb_listener_default_action_type
#     target_group_arn = var.aws_alb_target_group_arn
#   }
# }


resource "aws_lb_listener_rule" "archive_path" {
  listener_arn = var.aws_alb_listener_arn
  priority     = var.aws_alb_listener_priority

  action {
    type = "forward"
    target_group_arn = "${var.aws_alb_target_group_arn}"
  }

  condition {
    path_pattern {
      values = [var.aws_alb_listener_path]
    }
  }
}

