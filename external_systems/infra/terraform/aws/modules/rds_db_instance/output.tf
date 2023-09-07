output "arn" {
  value       = aws_db_instance.db_instance.arn
  description = "The ARN of the RDS instance."
}

output "address" {
  value       = aws_db_instance.db_instance.address
  description = "The hostname of the RDS instance."
  sensitive   = true
}

output "port" {
  value       = aws_db_instance.db_instance.port
  description = "The database port."
  sensitive   = true
}
