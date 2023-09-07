output "id" {
  value       = aws_db_subnet_group.db_subnet_group.id
  description = "The db subnet group name."
}

output "arn" {
  value       = aws_db_subnet_group.db_subnet_group.arn
  description = "The ARN of the db subnet group."
}
