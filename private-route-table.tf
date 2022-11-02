resource "aws_route_table" "route_tb_private" {
  vpc_id = aws_vpc.course-project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = {
    Name = "route_tb_private"
  }
}

resource "aws_route_table_association" "rtb-association_private1" {
  subnet_id      = aws_subnet.private-subnet1.id
  route_table_id = aws_route_table.route_tb_private.id
}

resource "aws_route_table_association" "rtb-association_private2" {
  subnet_id      = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.route_tb_private.id
}
