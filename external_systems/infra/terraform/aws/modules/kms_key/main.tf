/* KMS key */
resource "aws_kms_key" "kms_key" {
  is_enabled                         = true
  description                        = var.description
  key_usage                          = var.key_usage
  custom_key_store_id                = var.custom_key_store_id
  customer_master_key_spec           = var.customer_master_key_spec
  policy                             = var.policy
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  deletion_window_in_days            = var.deletion_window_in_days
  enable_key_rotation                = var.enable_key_rotation
  multi_region                       = var.multi_region
  tags                               = var.tags
}

/* KMS key alias */
resource "aws_kms_alias" "alias" {
  name          = var.alias
  target_key_id = aws_kms_key.kms_key.key_id
}
