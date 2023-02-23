provider "aws" {
  region     = var.region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_key_id
}

resource "aws_instance" "BO-TERRAFORM" {
  instance_type          = var.instance_id
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = ["${data.aws_security_group.selected.id}"]
  subnet_id              = data.aws_subnet.selected.id
  ami                    = "ami-08895422b5f3aa64a"
  tags = {
    Name = "BO-TERRAFORM"
  }
  root_block_device {
    volume_size           = "50"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  # data disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = "30"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
    tags                  = { "FileSystem" = "/hana/data" }
  }
}



