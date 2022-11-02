resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.lb-course-project.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg2.arn
  }
}

resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.front_end.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg1.arn
  }

  condition {
    path_pattern {
      values = ["/jenkins*"]
    }
  }
}

# app instance listener rule


resource "aws_lb_listener_rule" "static1" {
  listener_arn = aws_lb_listener.front_end.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg2.arn
  }

  condition {
    path_pattern {
      values = ["/app*"]
    }
  }
}
