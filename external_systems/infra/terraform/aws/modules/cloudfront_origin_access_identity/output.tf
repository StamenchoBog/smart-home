output "id" {
  value       = aws_cloudfront_origin_access_identity.cf_origin_access_identity.id
  description = "The identifier for the distribution. For example: EDFDVBD632BHDS5."
}

output "etag" {
  value       = aws_cloudfront_origin_access_identity.cf_origin_access_identity.etag
  description = "The current version of the origin access identity's information. For example: E2QWRUHAPOMQZL."
}

output "iam_arn" {
  value       = aws_cloudfront_origin_access_identity.cf_origin_access_identity.iam_arn
  description = "A pre-generated ARN for use in S3 bucket policies (see below). Example: arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E2QWRUHAPOMQZL."
}
