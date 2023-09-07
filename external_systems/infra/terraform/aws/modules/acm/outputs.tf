output "certificate_arn" {
  value       = aws_acm_certificate.certificate.arn
  description = "ARN of the certificate"
}

output "domain_validation_options" {
  value       = aws_acm_certificate.certificate.domain_validation_options
  description = "Set of domain validation objects which can be used to complete certificate validation. Can have more than one element, e.g., if SANs are defined. Only set if DNS-validation was used."
}
