data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = var.assume_role_principal_type
      identifiers = var.assume_role_principal_identifiers
    }
  }
}

resource "aws_iam_role" "role" {
  name                = var.role_name
  path                = "/"
  assume_role_policy  = data.aws_iam_policy_document.assume_role_policy.json
  managed_policy_arns = var.managed_policy_arns
  tags = merge(var.tags, {
    Environment = var.environment
  })
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = var.role_name
  role = aws_iam_role.role.name
  tags = merge(var.tags, {
    Environment = var.environment
  })
}
