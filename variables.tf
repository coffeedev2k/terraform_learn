variable "region" {
  default = "eu-central-1"
}

variable "instance_testing" {
  default = "t2.micro"
}

variable "instance_production" {
  default = "l2.large"
}
variable "instance_count_testing" {
  default = "2"
}
variable "instance_count_production" {
  default = "20"
}

variable "instance_count" {
  type = map
  default = {
    testing    = 2
    production = 20
  }
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

variable "environment" {
  default = "testing"
}
