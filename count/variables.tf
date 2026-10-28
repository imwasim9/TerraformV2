variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-0055977a6e828a4f4"
}

variable "ec2_tags" {
  type = map
  default = {
    Name      = "Terraform-1"
    Terraform = "true"
  }
}

variable "sg_tags" {
  type = map 
  default = {
    Name = "allow_all"
  }
}

variable "cidr" {
  type = string
  default = "0.0.0.0/0"
}

variable "protocol" {
  type = string
  default = "-1"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "zone_id" {
  default = "Z0498907312QP9JRHN116"
}

variable "instances" {
  default = ["mongodb", "redis", "mysql", "rabbitmq"]
}

variable "domain_name" {
  default = "wasdaws.cyou"
}
