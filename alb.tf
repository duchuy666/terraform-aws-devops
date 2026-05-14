resource "aws_security_group" "alb_sg" {
  name = "alb-sg"
  description = "Allow HTTP to ALB"
  vpc_id = module.network.vpc_id

  ingress {
    from_port = 80
    to_port = 80
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

resource "aws_lb" "main" {
  name = "my-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.alb_sg.id]
  subnets = [module.network.public_subnet_id, module.network.public_subnet_2_id]

  tags = {Name="my-alb"}
}

resource "aws_lb_target_group" "app" {
  name = "my-app-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = module.network.vpc_id
  target_type = "ip"

  health_check {
    path = "/"
    healthy_threshold = 2
    unhealthy_threshold = 3
    interval = 30
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}