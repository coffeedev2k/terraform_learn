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
  count    = lookup(var.instance_count, var.environment)
  instance = aws_instance.my_webserver[count.index].id
  tags     = merge(var.instance_tags, { Name = "${var.environment} -  server" })
}

resource "aws_instance" "my_webserver" {
  /*
  count                  = var.environment == "production" ? lookup(var.instance_count, "production") : lookup(var.instance_count, "testing")
  */

  count                  = lookup(var.instance_count, var.environment)
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = lookup(var.instance_size, var.environment)
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = templatefile("user_data.sh.tpl", {
    f_name   = "Alexey",
    l_name   = "Tarasov",
    packages = ["mc", "python-minimal", "openssh-server"]
  })
  tags = merge(var.instance_tags, { Name = "${var.environment} -  server" })
  lifecycle {
    create_before_destroy = true
  }
}

/*

locals {
  public_ip = [aws_eip.my_static_ip.*.public_ip]
}


resource "null_resource" "create_hosts_file" {
  provisioner "local-exec" {
    command = "echo ${var.region} > hosts"
  }
}
*/
