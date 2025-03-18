output "route53_zone_id" {
  value = aws_route53_zone.primary.zone_id
}

output "cert_arn" {
  value = aws_acm_certificate.cert.arn
}
