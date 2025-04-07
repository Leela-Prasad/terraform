output "alb_arn" {
    value = aws_lb.alb.arn
}

output "alb_tg_arn" {
    value = aws_lb_target_group.alb_tg.arn
}

output "alb_listener_arn" {
  value = aws_lb_listener.alb_listener.arn
}