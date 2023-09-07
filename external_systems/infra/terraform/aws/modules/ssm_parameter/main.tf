/* SSM parameter */
resource "aws_ssm_parameter" "ssm_parameter" {
  name            = var.name
  type            = var.type
  allowed_pattern = var.allowed_pattern
  data_type       = var.data_type
  description     = var.description
  value           = var.value
  key_id          = var.key_id
  tags = merge(var.tags, {
    Environment = var.environment
  })
  tier = var.tier
}
