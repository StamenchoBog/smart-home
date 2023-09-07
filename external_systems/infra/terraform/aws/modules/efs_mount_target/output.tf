output "id" {
  value       = aws_efs_mount_target.efs_mount_target.id
  description = "The ID of the mount target."
}

output "mount_target_dns_name" {
  value       = aws_efs_mount_target.efs_mount_target.mount_target_dns_name
  description = "The DNS name for the given subnet/AZ per documented convention."
}
