variable "region" {
  default = "eu-central-1"
}

variable "instance_type" {
  default = "t2.micro"
}


variable "allow_ports" {
  type    = list
  default = ["22", "80", "443", "8080"]
}

variable "instance_tags" {
  type = map
  default = {
    Name     = "Web Server Build by Terraform"
    tagvalue = "tagkey"
  }
}
