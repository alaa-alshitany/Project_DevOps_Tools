resource "aws_lb" "ALB" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-alb.id]
  subnets            = [module.network_module.subnets["public_subnet_1"].id, module.network_module.subnets["public_subnet_2"].id]

  tags = {
    Name = "Nodejs Alb"
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name        = "alb-target-group"
  port        = 3000
  protocol    = "HTTP"
  vpc_id = module.network_module.vpc_id

  tags = {
    Name = "Alb Target Group"
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn  = aws_lb.ALB.arn
  port               = 80
  protocol           = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "alb_target_group_attachment" {
  target_group_arn  = aws_lb_target_group.alb_target_group.arn
  target_id         = aws_instance.application.id
  port              = 3000
}