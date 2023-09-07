output "id" {
  description = "The globally unique identifier for the key."
  value       = aws_kms_key.kms_key.id
}

output "arn" {
  description = "The Amazon Resource Name (ARN) of the key."
  value       = aws_kms_key.kms_key.arn
}
