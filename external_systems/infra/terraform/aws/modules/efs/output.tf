output "dns_name" {
  value       = aws_efs_file_system.efs.dns_name
  description = "The DNS name for the filesystem"
}

output "arn" {
  value       = aws_efs_file_system.efs.arn
  description = "Amazon Resource Name of the file system"
}

output "id" {
  value       = aws_efs_file_system.efs.id
  description = "The ID that identifies the file system (e.g., fs-ccfc0d65)."
}
