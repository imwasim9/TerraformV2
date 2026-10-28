output "instance-details" {
  
  value = {
    instance_private_ips = aws_instance.terraform[*].private_ip
    instance_public_ips  = aws_instance.terraform[*].public_ip
  }
}
