resource "aws_lb" "medusa_alb" {
  name               = "medusa-alb"
  internal           = false
  load_balancer_type = "application"
}

resource "aws_lb_target_group" "medusa_tg" {
  port     = 9000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "medusa_listener" {
  load_balancer_arn = aws_lb.medusa_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.medusa_tg.arn
  }
}
