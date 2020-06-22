variable "region" {
  default = "eu-central-1"
}


variable "instance_count" {
  type = map
  default = {
    testing    = 2
    production = 4
  }
}

variable "instance_size" {
  type = map
  default = {
    testing    = "t2.micro"
    production = "l2.large"
  }
}


variable "instance_allow_ports" {
  type = map
  default = {
    testing    = ["22", "80", "443", "8080"]
    production = ["80", "443"]
  }
}


variable "instance_tags" {
  type = map
  default = {
    Name = "Web Server Build by Terraform"
    #    Environment = lookup(var.instance_size, var.environment)
  }
}

variable "environment" {
  default = "testing"
}
