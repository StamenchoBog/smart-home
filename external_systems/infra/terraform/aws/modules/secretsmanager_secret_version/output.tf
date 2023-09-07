output "id" {
  value       = aws_secretsmanager_secret_version.secret_version.id
  description = "A pipe delimited combination of secret ID and version ID."
}

output "version_id" {
  value       = aws_secretsmanager_secret_version.secret_version.version_id
  description = "The unique identifier of the version of the secret."
}
