

output "name_servers" {
  value = [for zone in aws_route53_zone.primary : zone.name_servers]
}
