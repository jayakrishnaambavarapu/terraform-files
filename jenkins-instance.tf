resource "aws_instance" "jenkins" {
  ami           = "ami-0149b2da6ceec4bb0" # ubuntu-20 ami
  instance_type = "t2.micro"
  subnet_id      = aws_subnet.private-subnet1.id
  associate_public_ip_address = false
  key_name = "sample-key"
  vpc_security_group_ids = [aws_security_group.private-instance-sg.id]
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 20
  }

  
  


  tags = {
    Name = "jenkins"
  }
}
