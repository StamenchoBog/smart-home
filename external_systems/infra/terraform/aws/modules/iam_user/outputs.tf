output "arn" {
  description = "The ARN assigned by AWS for this user."
  value       = aws_iam_user.iam_user.arn
}

output "name" {
  description = "The user's name."
  value       = aws_iam_user.iam_user.name
}
