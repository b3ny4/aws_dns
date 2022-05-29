
# Route 53

resource "aws_route53_zone" "primary" {
  for_each = var.domains
  name     = each.value.domain
}

resource "aws_route53_record" "root" {
  for_each = var.domains
  zone_id  = aws_route53_zone.primary[each.key].zone_id
  name     = each.value.domain
  type     = "A"
  ttl      = "5"
  records  = each.value.ips
}
