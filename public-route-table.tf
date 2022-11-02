resource "aws_route_table" "route_tb" {
  vpc_id = aws_vpc.course-project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-course-project.id
  }
  tags = {
    Name = "route_tb"
  }
}

resource "aws_route_table_association" "rtb-association1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.route_tb.id
}
resource "aws_route_table_association" "rtb-association2" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.route_tb.id
}
