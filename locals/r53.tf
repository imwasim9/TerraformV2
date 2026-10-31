
resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.terraform
  # count = 4
  allow_overwrite = true
  name            = "${each.key}.${var.domain_name}"
  ttl             = 1
  type            = "A"
  zone_id         = var.zone_id
  records = [each.value.private_ip]
}