resource "aws_instance" "instance" {
  ami                  = var.ami
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = var.instance_profile_name

  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.ec2_security_groups_ids


  metadata_options {
    http_endpoint = var.metadata_options.http_endpoint
    http_tokens   = var.metadata_options.http_tokens
  }

  ebs_optimized = var.enable_ebs_optimized
  root_block_device {
    encrypted = var.enable_root_block_device_encryption
  }

  monitoring = var.enable_instance_monitoring

  user_data = var.user_data

  tags = merge(var.tags, {
    Environment = var.environment
  })
}
