resource "aws_lb_target_group" "lb-tg1" {
  name     = "lb-tg1"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.course-project.id
  target_type = "instance"
  slow_start = 900
  health_check {
    enabled = true
    matcher = "200-302"
    path = "/jenkins"

  }

}
resource "aws_lb_target_group" "lb-tg2" {
  name     = "lb-tg2"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.course-project.id
  target_type = "instance"
  slow_start = 900
  health_check {
    enabled = true
    matcher = "200-302"
    path = "/app"

  }

}
