/*
output "aws_instance_my_webserver" {
  value = [aws_eip.my_static_ip.*.id]
}

output "aws_eip_my_static_ip" {
  value = [aws_eip.my_static_ip.*.public_ip]
}

output "aws_eip_my_public_dns" {
  value = [aws_eip.my_static_ip.*.public_dns]
}

output "aws_instance_my_webserver_availability_zone" {
  value = [aws_instance.my_webserver.*.availability_zone]
}

output "data_aws_caller_identity" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_instance_my_webserver_instance_type" {
  value = [aws_instance.my_webserver[*].instance_type]
}

*/
output "region" {
  value = var.region
}

output "allow_ports" {
  value = lookup(var.instance_allow_ports, var.environment)
}


output "instance_tags" {
  value = var.instance_tags
}



output "servers_all" {
  value = {
    for server in aws_instance.my_webserver :
    server.id => [server.public_ip, server.public_dns, server.availability_zone, server.instance_type, server.ami]
  }
}

output "eip_all" {
  value = {
    for eip in aws_eip.my_static_ip :
    eip.id => [eip.public_ip, eip.public_dns, eip.instance]
  }
}

/*
association_id - The ID representing the association of the address with an instance in a VPC.
domain - Indicates whether the address is for use in EC2-Classic (standard) or in a VPC (vpc).
id - If VPC Elastic IP, the allocation identifier. If EC2-Classic Elastic IP, the public IP address.
instance_id - The ID of the instance that the address is associated with (if any).
network_interface_id - The ID of the network interface.
network_interface_owner_id - The ID of the AWS account that owns the network interface.
private_ip - The private IP address associated with the Elastic IP address.
private_dns - The Private DNS associated with the Elastic IP address.
public_ip - Public IP address of Elastic IP.
public_dns - Public DNS associated with the Elastic IP address.
public_ipv4_pool - The ID of an address pool.
customer_owned_ipv4_pool - The ID of a Customer Owned IP Pool. For more on customer owned IP addressed check out Customer-owned IP addresses guide
customer_owned_ip - Customer Owned IP.
tags
*/
