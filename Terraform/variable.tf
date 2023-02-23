variable "vpc_id" {
  default = "vpc-0c3bab4b07dc87be8"
}
data "aws_vpc" "selected" {
  id = var.vpc_id
}


variable "security_group_id" {
  default = "sg-0f3bd80ae11449613"
}

data "aws_security_group" "selected" {
  id = var.security_group_id
}

variable "subnet_id" {
  default = "subnet-0261eaeb8680441ad"
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}


variable "instance_id" {
  default = "t2.micro"
}











