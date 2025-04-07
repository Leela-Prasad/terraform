resource "aws_lb" "nlb" {
  name = "CSDCNonProductionNLB"
  internal = true
  load_balancer_type = "network"
  subnets = [var.subnet_id_1, var.subnet_id_2]
}

resource "aws_lb_target_group" "nlb_tg" {
  target_type = "alb"
  name = "CSDCNonProductionNLBTG"
  port = 443
  protocol = "TCP"
  vpc_id = var.vpc_id

  health_check {
    path = "/logger/actuator/health"
    protocol = "HTTPS"
    matcher = "200-399"
  }
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port = 443
  protocol = "TCP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.nlb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "nlb_to_alb" {
  target_group_arn = aws_lb_target_group.nlb_tg.arn
  target_id = var.alb_arn
}