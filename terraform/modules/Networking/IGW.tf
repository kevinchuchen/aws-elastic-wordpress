resource "aws_internet_gateway" "WP-IGW" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "WP-IGW"
  }
}
