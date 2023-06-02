resource "aws_alb" "application_load_balancer" {
  name               = var.aws_alb_name # Naming our load balancer
  load_balancer_type = "application"
  subnets            = var.aws_default_subnets
  # Referencing the security group
  security_groups = ["${var.aws_alb_sg_id}"]
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.application_load_balancer.arn # Referencing our load balancer
  port              = var.aws_alb_listener_port
  protocol          = var.aws_alb_listener_protocol
  # default_action {
  #   type             = var.aws_alb_listener_default_action_type
  #   target_group_arn = aws_lb_target_group.target_group.arn # Referencing our tagrte group
  # }
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "application/json"
      message_body = "{ 'message':'ok' }"
      status_code  = "200"
    }
  }
}

