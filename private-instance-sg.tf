resource "aws_security_group" "private-instance-sg" {
  name        = "private-instance-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.course-project.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [aws_vpc.course-project.cidr_block]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "private-instance-sg"
  }
}
