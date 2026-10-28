
resource "aws_instance" "example" {
  ami                    = "ami-0055977a6e828a4f4"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]


  tags = {
    Name      = "Terraform-1"
    Terraform = "true"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow-all"
  description = "Allow all inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_all"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_ingress" {
  security_group_id = aws_security_group.allow_all.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports  
}

resource "aws_vpc_security_group_egress_rule" "allow_all_egress" {
  security_group_id = aws_security_group.allow_all.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
