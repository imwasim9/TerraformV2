
resource "aws_route53_record" "roboshop" {
  count = 4
  allow_overwrite = true
  name            = "${var.instances[count.index]}.${var.domain_name}"
  ttl             = 1
  type            = "A"
  zone_id         = var.zone_id
  records = [aws_instance.terraform[count.index].private_ip]
}