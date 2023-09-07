output "arn" {
  value       = aws_ssm_parameter.ssm_parameter.arn
  description = "ARN of the parameter"
}

output "version" {
  value       = aws_ssm_parameter.ssm_parameter.value
  description = "Version of the parameter"
}
