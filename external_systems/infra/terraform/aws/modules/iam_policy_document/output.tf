output "json" {
  value       = data.aws_iam_policy_document.policy_document.json
  description = "Standard JSON policy document rendered based on the arguments above."
}