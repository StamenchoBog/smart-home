variable "environment" {
  type = string
}

variable "replication_group_id" {
  type    = string
  default = null
}

variable "description" {
  type = string
}

variable "apply_immediately" {
  type    = bool
  default = null
}

variable "at_rest_encryption_enabled" {
  type    = bool
  default = null
}

variable "transit_encryption_enabled" {
  type    = bool
  default = true
}

variable "auth_token" {
  type    = string
  default = null
}

variable "auto_minor_version_upgrade" {
  type    = bool
  default = null
}

variable "automatic_failover_enabled" {
  type    = bool
  default = null
}

variable "data_tiering_enabled" {
  type    = bool
  default = null
}

variable "engine" {
  type    = string
  default = null
}

variable "engine_version" {
  type    = string
  default = null
}

variable "final_snapshot_identifier" {
  type    = string
  default = null
}

variable "global_replication_group_id" {
  type    = string
  default = null
}

variable "kms_key_id" {
  type    = string
  default = null
}

variable "log_delivery_configurations" {
  type = object({
    destination      = string
    destination_type = string
    log_format       = string
    log_type         = string
  })
  default = null
}

variable "maintenance_window" {
  type    = string
  default = null
}

variable "multi_az_enabled" {
  type    = bool
  default = null
}

variable "node_type" {
  type    = string
  default = null
}

variable "notification_topic_arn" {
  type    = string
  default = null
}

variable "num_cache_clusters" {
  type    = number
  default = null
}

variable "num_node_groups" {
  type    = number
  default = null
}

variable "parameter_group_name" {
  type    = string
  default = null
}

variable "port" {
  type      = number
  default   = null
  sensitive = true
}

variable "preferred_cache_cluster_azs" {
  type    = list(string)
  default = null
}

variable "replicas_per_node_group" {
  type    = number
  default = null
}

variable "security_group_ids" {
  type    = list(string)
  default = null
}

variable "security_group_names" {
  type    = list(string)
  default = null
}

variable "snapshot_arns" {
  type    = list(string)
  default = null
}

variable "snapshot_name" {
  type    = string
  default = null
}

variable "snapshot_retention_limit" {
  type    = number
  default = null
}

variable "snapshot_window" {
  type    = string
  default = null
}

variable "subnet_group_name" {
  type    = string
  default = null
}

variable "tags" {
  type = map(string)
}
