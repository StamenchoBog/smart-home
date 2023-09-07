output "aws_launch_template_id" {
  value       = aws_launch_template.asg_lt.id
  description = "The ID of the launch template."
}

output "aws_launch_template_arn" {
  value       = aws_launch_template.asg_lt.arn
  description = "Amazon Resource Name (ARN) of the launch template."
}

output "latest_version" {
  value       = aws_launch_template.asg_lt.latest_version
  description = "The latest version of the launch template."
}
