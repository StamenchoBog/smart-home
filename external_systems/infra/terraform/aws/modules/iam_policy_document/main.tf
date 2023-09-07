data "aws_iam_policy_document" "policy_document" {
  policy_id                 = var.policy_id
  source_policy_documents   = var.source_policy_documents
  override_policy_documents = var.override_policy_documents
  version                   = var.policy_version

  dynamic "statement" {
    for_each = var.statements[*]

    content {
      sid     = statement.value.sid
      actions = statement.value.actions
      effect  = statement.value.effect

      dynamic "principals" {
        for_each = statement.value.principals == null ? [] : statement.value.principals
        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = statement.value.conditions == null ? [] : statement.value.conditions
        content {
          variable = condition.value.variable
          test     = condition.value.test
          values   = condition.value.values
        }
      }

      resources = statement.value.resources
    }
  }
}
