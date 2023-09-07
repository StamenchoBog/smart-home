output "id" {
  value       = aws_autoscaling_group.asg.id
  description = "Auto Scaling Group id."
}

output "arn" {
  value       = aws_autoscaling_group.asg.arn
  description = "ARN for this Auto Scaling Group."
}

output "name" {
  value       = aws_autoscaling_group.asg.name
  description = "Auto Scaling Group name."
}
