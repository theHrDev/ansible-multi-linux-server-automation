data "aws_key_pair" "control-kp" {
  filter {
    name   = "key-name"
    values = ["control-kp"]
  }
}
data "aws_key_pair" "host-kp" {
  filter {
    name   = "key-name"
    values = ["client-kp"]
  }
}

# resource "aws_key_pair" "control-kp" {
#   key_name = "control-kp"
#   public_key = file("")
# }
# resource "aws_key_pair" "host-kp" {
#   key_name = "host-kp"
#   public_key = file("")
# }
