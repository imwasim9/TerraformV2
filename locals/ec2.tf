
resource "aws_instance" "terraform" {
  for_each = toset(var.instances)
  # for_each = var.instances
  # count = 4
  ami                    = local.ami_id
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = local.ec2_tags
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
