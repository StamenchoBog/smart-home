/* RDS DB instance */

resource "aws_db_instance" "db_instance" {

  #ToDo: Add tags to snapshots

  db_name = var.db_name

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage

  # Basic config
  instance_class = var.instance_class

  engine         = var.engine
  engine_version = var.engine_version
  username       = var.username
  password       = var.password
  port           = var.port

  storage_type       = var.storage_type
  storage_throughput = var.storage_throughput


  iops                                  = var.iops
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_retention_period


  # AZ
  availability_zone = var.availability_zone
  multi_az          = var.multi_az

  # Network
  db_subnet_group_name      = var.db_subnet_group_name
  vpc_security_group_ids    = var.vpc_security_group_ids
  customer_owned_ip_enabled = var.customer_owned_ip_enabled

  network_type         = var.network_type
  publicly_accessible  = var.publicly_accessible
  option_group_name    = var.option_group_name
  parameter_group_name = var.parameter_group_name


  custom_iam_instance_profile         = var.custom_iam_instance_profile
  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  kms_key_id        = var.kms_key_id
  storage_encrypted = var.storage_encrypted

  # Update and upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  allow_major_version_upgrade = var.allow_major_version_upgrade

  # Character config
  character_set_name       = var.character_set_name
  nchar_character_set_name = var.nchar_character_set_name

  # Backup config
  backup_retention_period  = var.backup_retention_period
  backup_window            = var.backup_window
  delete_automated_backups = var.enable_delete_automated_backups

  # Maintanence config
  maintenance_window = var.maintenance_window

  # Snapshot
  copy_tags_to_snapshot     = var.enable_copy_tags_to_snapshot
  final_snapshot_identifier = var.final_snapshot_identifier
  skip_final_snapshot       = var.skip_final_snapshot
  snapshot_identifier       = var.snapshot_identifier

  # Logs and monitoring
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  monitoring_interval             = var.monitoring_interval
  monitoring_role_arn             = var.monitoring_role_arn

  # Blue-Green update
  dynamic "blue_green_update" {
    for_each = var.blue_green_update[*]

    content {
      enabled = blue_green_update.value.enabled
    }
  }

  # Replicas config
  replica_mode        = var.replica_mode
  replicate_source_db = var.replicate_source_db


  # Active Directory
  domain               = var.domain
  domain_iam_role_name = var.domain_iam_role_name

  ca_cert_identifier = var.ca_cert_identifier
  license_model      = var.license_model

  identifier        = var.identifier
  identifier_prefix = var.identifier_prefix

  dynamic "restore_to_point_in_time" {
    for_each = var.restore_to_point_in_time[*]

    content {
      restore_time                             = restore_to_point_in_time.value.restore_time
      source_db_instance_automated_backups_arn = restore_to_point_in_time.value.source_db_instance_automated_backups_arn
      source_db_instance_identifier            = restore_to_point_in_time.value.source_db_instance_identifier
      source_dbi_resource_id                   = restore_to_point_in_time.value.source_dbi_resource_id
      use_latest_restorable_time               = restore_to_point_in_time.value.use_latest_restorable_time
    }
  }

  # Deployments and deletion
  apply_immediately   = var.apply_immediately
  deletion_protection = var.deletion_protection

  timezone = var.timezone

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(var.tags, {
    Environment = var.environment
  })

}
