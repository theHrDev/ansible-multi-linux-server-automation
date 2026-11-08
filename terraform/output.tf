output "ct_private_ip" {
  description = "control private_ip"
  value = aws_instance.control.private_ip
}
output "ht_private_ip" {
  description = "host private_ip"
  value = aws_instance.host-server-one.private_ip
}
output "ct_public_ip" {
  description = "control private_ip"
  value = aws_instance.control.public_ip
}
output "ht_public_ip" {
  description = "host private_ip"
  value = aws_instance.host-server-one.public_ip
}
