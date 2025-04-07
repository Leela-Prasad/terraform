# Need to replace with 443 port and private subnet cidr
resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "alb" {
  name     = "CSDCNonProductionALB"
  internal = false
  # internal = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [var.subnet_id_1, var.subnet_id_2]
}

resource "aws_lb_target_group" "alb_tg" {
  name     = "CSDCNonProductionALBTG"
  protocol = "HTTPS"
  port     = 443
  vpc_id   = var.vpc_id

  health_check {
    path     = "/logger/actuator/health"
    protocol = "HTTPS"
    matcher  = "200"
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.cert_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}


