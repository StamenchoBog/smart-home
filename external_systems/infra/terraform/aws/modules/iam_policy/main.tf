resource "aws_iam_policy" "iam_policy" {
  name        = var.name
  description = var.description
  path        = var.path
  policy      = var.policy
  tags = merge(var.tags, {
    Environment = var.environment
  })
}
