
resource "aws_instance" "terraform" {
  count = 4
  ami                    = var.ami_id
  instance_type          = var.environment == "qa" ? var.instance_type : "t2.medium"
  vpc_security_group_ids = [aws_security_group.allow_all.id]


  tags = {
    Name = var.instances[count.index]
    Terraform = "true"
    Project = "Roboshop"
  }
}


resource "aws_security_group" "allow_all" {
  name        = "allow-all"
  description = "Allow all inbound traffic and all outbound traffic"

  tags = var.sg_tags
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_ingress" {
  security_group_id = aws_security_group.allow_all.id
  cidr_ipv4         = var.cidr
  ip_protocol       = var.protocol # semantically equivalent to all ports  
}

resource "aws_vpc_security_group_egress_rule" "allow_all_egress" {
  security_group_id = aws_security_group.allow_all.id
  cidr_ipv4         = var.cidr
  ip_protocol       = var.protocol # semantically equivalent to all ports
}
