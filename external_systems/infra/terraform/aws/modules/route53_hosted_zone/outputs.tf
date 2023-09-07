output "hosted_zone_id" {
  value = aws_route53_zone.hosted_zone.zone_id
}

output "hosted_zone_name" {
  value = aws_route53_zone.hosted_zone.name
}
