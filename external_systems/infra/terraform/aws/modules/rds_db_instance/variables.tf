variable "environment" {
  type = string
}

variable "db_name" {
  type    = string
  default = null
}

variable "identifier" {
  type    = string
  default = null
}

# Conflicts with `identifier`.
variable "identifier_prefix" {
  type    = string
  default = null
}

# Engine
variable "engine" {
  type    = string
  default = null
}

variable "engine_version" {
  type    = string
  default = null
}

variable "username" {
  type      = string
  default   = null
  sensitive = true
}

variable "password" {
  type      = string
  default   = null
  sensitive = true
}


variable "port" {
  type      = number
  default   = null
  sensitive = true
}

variable "instance_class" {
  type = string
}

variable "storage_type" {
  type    = string
  default = null
}

variable "storage_throughput" {
  type    = string
  default = null
}

variable "storage_encrypted" {
  type    = bool
  default = null
}

variable "replica_mode" {
  type    = string
  default = null
}

variable "replicate_source_db" {
  type    = string
  default = null
}

variable "iops" {
  type    = string
  default = null
}

# Encryption
variable "kms_key_id" {
  type    = string
  default = null
}

# Network
variable "vpc_security_group_ids" {
  type    = set(string)
  default = null
}

variable "db_subnet_group_name" {
  type    = string
  default = null
}

variable "multi_az" {
  type    = bool
  default = null
}

variable "publicly_accessible" {
  type    = bool
  default = null
}

# Only for One AZ
variable "availability_zone" {
  type    = string
  default = null
}

variable "network_type" {
  type    = string
  default = null
}

variable "customer_owned_ip_enabled" {
  type    = bool
  default = null
}

variable "option_group_name" {
  type    = string
  default = null
}

variable "parameter_group_name" {
  type    = string
  default = null
}

variable "performance_insights_enabled" {
  type    = bool
  default = null
}

variable "performance_insights_kms_key_id" {
  type    = string
  default = null
}

variable "performance_insights_retention_period" {
  type    = number
  default = null
}

# If replicate_source_db is set, the value is ignored during the creation of the instance.
variable "allocated_storage" {
  type = number
}

variable "allow_major_version_upgrade" {
  type    = bool
  default = null
}

variable "auto_minor_version_upgrade" {
  type    = bool
  default = null
}

variable "backup_retention_period" {
  type    = number
  default = null
}

variable "backup_window" {
  type    = string
  default = null
}

variable "maintenance_window" {
  type    = string
  default = null
}

variable "max_allocated_storage" {
  type    = number
  default = null
}

variable "blue_green_update" {
  type = object({
    enabled = bool
  })
  default = null
}

variable "ca_cert_identifier" {
  type    = string
  default = null
}

variable "character_set_name" {
  type    = string
  default = null
}

variable "nchar_character_set_name" {
  type    = string
  default = null
}

# Snapshot & Backups
variable "enable_delete_automated_backups" {
  type    = bool
  default = null
}

variable "enable_copy_tags_to_snapshot" {
  type    = bool
  default = null
}

variable "final_snapshot_identifier" {
  type    = bool
  default = null
}

variable "skip_final_snapshot" {
  type    = bool
  default = null
}

variable "snapshot_identifier" {
  type    = string
  default = null
}



# IAM
variable "custom_iam_instance_profile" {
  type    = string
  default = null
}

variable "iam_database_authentication_enabled" {
  type    = bool
  default = null
}

# Active Directory
variable "domain" {
  type    = string
  default = null
}

variable "domain_iam_role_name" {
  type    = string
  default = null
}

# Logs
variable "enabled_cloudwatch_logs_exports" {
  type    = set(string)
  default = null
}

# Monitoring
variable "monitoring_interval" {
  type    = number
  default = null
}

variable "monitoring_role_arn" {
  type    = string
  default = null
}

# Licences and certificates
variable "license_model" {
  type    = string
  default = null
}

# Deployment and deletion configuration
variable "deletion_protection" {
  type    = bool
  default = null
}

variable "apply_immediately" {
  type    = bool
  default = null
}

variable "restore_to_point_in_time" {
  type = object({
    restore_time                             = optional(string)
    source_db_instance_identifier            = optional(string)
    source_db_instance_automated_backups_arn = optional(string)
    source_dbi_resource_id                   = optional(string)
    use_latest_restorable_time               = optional(bool)
  })
  default = null
}

variable "timezone" {
  type    = string
  default = null
}

variable "tags" {
  type = map(string)
}
