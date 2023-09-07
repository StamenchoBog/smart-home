output "efs_access_point_id" {
  value       = aws_efs_access_point.access_point.id
  description = "ID of the access point"
}

output "efs_access_point_arn" {
  value       = aws_efs_access_point.access_point.arn
  description = "ARN of the access point"
}
