/* EFS file system */

resource "aws_efs_file_system" "efs" {

  creation_token = var.creation_token

  # Only if One AZ
  availability_zone_name = var.availability_zone_name

  encrypted  = var.enable_encryption
  kms_key_id = var.kms_key_id

  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode

  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps

  # Below lifecycle policies are defined separately because of a known issue with terraform.
  # See this https://github.com/hashicorp/terraform-provider-aws/issues/20953 for more info

  # Lifecycle policy for transition to IA
  dynamic "lifecycle_policy" {
    for_each = var.lifecycle_policy[*]
    content {
      transition_to_ia = lifecycle_policy.value.transition_to_ia
    }
  }

  # Lifecycle policy for transition to primary storage class
  dynamic "lifecycle_policy" {
    for_each = var.lifecycle_policy[*]
    content {
      transition_to_primary_storage_class = lifecycle_policy.value.transition_to_primary_storage_class
    }
  }

  tags = merge(var.tags, {
    Environment = var.environment
  })
}