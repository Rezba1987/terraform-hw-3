resource "aws_lb" "task3alb" {
  name               = "task3alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.hw_sg.id]
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]

  tags = var.common_tags
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.task3alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.task3tg.arn
  }

  tags = var.common_tags
}

resource "aws_lb_target_group" "task3tg" {
  name     = "task3tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  tags = var.common_tags
}