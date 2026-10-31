data "aws_ami" "joindevops" {
    owners           = ["973714476881"]
    most_recent      = true
    
   filter {
    name   = "name"
    values = ["*DevOps-Practice*"]
  }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

output "ami_id" {
    value = data.aws_ami.joindevops.id
}

data "aws_instance" "Terraform" {
    instance_id = "i-007743722c4229efd"
}

output "Terraform" {
    value = data.aws_instance.Terraform.public_ip
}