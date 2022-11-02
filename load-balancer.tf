resource "aws_lb" "lb-course-project" {
  name               = "lb-course-project"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load-balancer-sg.id]
  subnet_mapping {
    subnet_id     = aws_subnet.public-subnet1.id
  }

  subnet_mapping {
    subnet_id     = aws_subnet.public-subnet2.id
  }


  enable_deletion_protection = false
  
  tags = {
    Nmae = "lb-course-project"
  }
}
