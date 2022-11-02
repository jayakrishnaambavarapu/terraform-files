resource "aws_security_group" "bastion-sg" {
  name        = "bastion-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.course-project.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["117.251.3.46/32"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "bastion-sg"
  }
}
