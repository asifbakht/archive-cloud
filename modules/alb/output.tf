output "aws_lb_arn" {
  value = aws_alb.application_load_balancer.arn
}


output "aws_lb_listener_arn" {
  value = aws_lb_listener.listener.arn
}
