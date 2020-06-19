
output "aws_instance_my_webserver" {
  value = aws_eip.my_static_ip.id
}
output "aws_eip_my_static_ip" {
  value = aws_eip.my_static_ip.public_ip
}
output "data_aws_ami_latest_ubuntu_architecture" {
  value = data.aws_ami.latest_ubuntu.architecture
}
output "data_aws_ami_latest_ubuntu_virtualization_type" {
  value = data.aws_ami.latest_ubuntu.virtualization_type
}
output "aws_instance_my_webserver_availability_zone" {
  value = aws_instance.my_webserver.availability_zone
}
output "data_aws_caller_identity" {
  value = data.aws_caller_identity.current.account_id
}
output "aws_instance_my_webserver_instance_type" {
  value = aws_instance.my_webserver.instance_type
}
output "region" {
  value = var.region
}
output "allow_ports" {
  value = var.allow_ports
}
output "instance_tags" {
  value = var.instance_tags
}



output "strange" {
  value = merge(var.instance_tags, { Name = "${var.instance_type}Web Server IP" })
}

output "strange2" {
  value = local.ins_reg
}
