resource "aws_route53_zone" "this" {
  name = var.dns_domain
}

# This add a record A to expose an ALB in the new zone.
resource "aws_route53_record" "this" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "test.${var.dns_domain}"
  type    = "A"
  records = [ "8.8.8.8" ]
}
