provider "aws" { region = var.region }
data "aws_caller_identity" "current" {}

data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_webserver.id
  tags = {
    Name = "Web Server IP"
  }
}

resource "aws_instance" "my_webserver" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = templatefile("user_data.sh.tpl", {
    f_name   = "Alexey",
    l_name   = "Tarasov",
    packages = ["mc", "python-minimal", "openssh-server"]
  })
  tags = var.instance_tags
  lifecycle {
    create_before_destroy = true
  }
}
