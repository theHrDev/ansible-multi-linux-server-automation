resource "aws_instance" "control" {
  ami                    = var.CONTROL_AMI
  instance_type          = var.INSTANCE_TYPE
  key_name               = data.aws_key_pair.control-kp.key_name
  vpc_security_group_ids = [aws_security_group.control-sg.id]
  subnet_id              = aws_subnet.main.id
  tags = {
    Name = "control-ec2"
  }
}
resource "aws_instance" "host-server-one" {
  ami                    = var.HOST_AMI_AMAZON
  instance_type          = var.INSTANCE_TYPE
  key_name               = data.aws_key_pair.host-kp.key_name
  vpc_security_group_ids = [aws_security_group.host.id]
  subnet_id              = aws_subnet.main.id
  tags = {
    Name = "host-server-one"
  }
}
resource "aws_instance" "host-server-two" {
  ami                    = var.HOST_AMI_UBUNTU
  count                  = 2
  instance_type          = var.INSTANCE_TYPE
  key_name               = data.aws_key_pair.host-kp.key_name
  vpc_security_group_ids = [aws_security_group.host.id]
  subnet_id              = aws_subnet.main.id
  tags = {
    Name = "host-server-two"
  }
}
