resource "aws_secretsmanager_secret" "secret" {
  name                    = var.name
  description             = var.description
  kms_key_id              = var.kms_key_id
  policy                  = var.policy
  recovery_window_in_days = var.recovery_window_in_days

  dynamic "replica" {
    for_each = var.replica[*]
    content {
      kms_key_id = replica.value.kms_key_id
      region     = replica.value.region
    }
  }

  force_overwrite_replica_secret = var.force_overwrite_replica_secret
  tags = merge(var.tags, {
    Environment = var.environment
  })
}
