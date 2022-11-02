resource "aws_internet_gateway" "igw-course-project" {
  vpc_id = aws_vpc.course-project.id

  tags = {
    Name = "igw-course-project"
  }
}
