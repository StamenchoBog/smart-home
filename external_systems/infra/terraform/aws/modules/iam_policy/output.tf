output "id" {
  value       = aws_iam_policy.iam_policy.id
  description = "The ID assigned by AWS to this policy."
}

output "arn" {
  value       = aws_iam_policy.iam_policy.arn
  description = "The ARN assigned by AWS to this policy."
}
