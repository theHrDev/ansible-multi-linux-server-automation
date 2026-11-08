resource "aws_vpc" "control" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "control-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id = aws_vpc.control.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-north-1a"
  map_public_ip_on_launch = true
  tags = {
    Name ="main-subnet"
  }
}
resource "aws_internet_gateway" "internet" {
  vpc_id = aws_vpc.control.id
  tags = {
    Name = "main-igw"
  }
}
resource "aws_route_table" "main-rt" {
  vpc_id = aws_vpc.control.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet.id
  }

  tags = {
    Name = "main-route-table"
  }
}

resource "aws_route_table_association" "main" {
  route_table_id = aws_route_table.main-rt.id
  subnet_id      = aws_subnet.main.id
}

resource "aws_vpc" "host" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "host-vpc"
  }
}