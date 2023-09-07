output "id" {
  value       = aws_cloudfront_distribution.cf.id
  description = "The identifier for the distribution. For example: EDFDVBD632BHDS5."
}

output "arn" {
  value       = aws_cloudfront_distribution.cf.arn
  description = "The ARN (Amazon Resource Name) for the distribution. For example: arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5, where 123456789012 is your AWS account ID."
}

output "status" {
  value       = aws_cloudfront_distribution.cf.status
  description = "The current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system."
}

output "domain_name" {
  value = aws_cloudfront_distribution.cf.domain_name
}

output "hosted_zone_id" {
  value = aws_cloudfront_distribution.cf.hosted_zone_id
}
