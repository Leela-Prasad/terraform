# Need to replace with 443 port and private subnet cidr
resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "alb" {
    name = "CSDCNonProductionALB"
    internal = false
    # internal = true
    load_balancer_type = "application"
    security_groups = [aws_security_group.alb_sg.id]
    subnets = [var.subnet_id_1, var.subnet_id_2]
}

resource "aws_lb_target_group" "alb_tg" {
  name = "CSDCNonProductionALBTG"
  protocol = "HTTP"
  port = 8080
  vpc_id = var.vpc_id

  health_check {
    path = "/test"
    protocol = "HTTP"
    matcher = "200"
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port = 8080
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "alb_to_instances" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  port = 8080
  target_id = var.target_id
}