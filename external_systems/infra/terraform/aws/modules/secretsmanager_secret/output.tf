output "id" {
  value       = aws_secretsmanager_secret.secret.id
  description = "ID of the secret."
}

output "arn" {
  value       = aws_secretsmanager_secret.secret.arn
  description = "ARN of the secret."
}
