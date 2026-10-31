variable "sg_tags" {
  type = map 
  default = {
    Name = "allow_all"
  }
}

variable "common_tags" {
    type = map
    default = {
        Terraform = "true"
        Project = "roboshop"
        Environment = "dev"
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

variable "project" {
  type = string
  default = "roboshop"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "zone_id" {
  default = "Z0498907312QP9JRHN116"
}

variable "instances" {
  default = ["mongodb"]
  # ["mongodb", "redis", "mysql", "rabbitmq"]
  # default = {
  #   mongodb = "t3.micro"
  #   redis = "t3.micro"
  # }
}

variable "domain_name" {
  default = "wasdaws.cyou"
}
