variable "AWS_REGION" {
  type = string
  default = "eu-north-1"
}

variable "INSTANCE_TYPE" {
  type = string
  default = "t3.micro"
}

variable "CONTROL_AMI" {
  type = string
  default = "ami-021aaf3749be66813"
}
variable "HOST_AMI_AMAZON" {
  type = string
  default = "ami-0516089d963059a51"
}
variable "HOST_AMI_UBUNTU" {
  type = string
  default = "ami-0fd9576cca965bd19"
}