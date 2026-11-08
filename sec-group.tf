resource "aws_security_group" "control-sg" {
  name = "control-sg"
  vpc_id = aws_vpc.control.id
  ingress  {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "control-sg"
  }
}

resource "aws_security_group" "host" {
  name = "host-sg"
  vpc_id = aws_vpc.control.id

    ingress  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [aws_security_group.control-sg.id]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}