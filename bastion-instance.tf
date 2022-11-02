resource "aws_instance" "bastion" {
  ami           = "ami-0149b2da6ceec4bb0" # ubuntu-20 ami
  instance_type = "t2.micro"
  subnet_id      = aws_subnet.public-subnet1.id
  associate_public_ip_address = true
  key_name = "sample-key"
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]
  


  tags = {
    Name = "bastion"
  }
}
