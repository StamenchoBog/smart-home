variable "environment" {
  type = string
}

variable "cluster_id" {
  type    = string
  default = null
}

# Required if replication_group_id is not specified
variable "engine" {
  type    = string
  default = null
}

# Required unless replication_group_id is provided
variable "node_type" {
  type    = string
  default = null
}

# Required unless replication_group_id is provided
variable "num_cache_nodes" {
  type    = number
  default = null
}

# Required unless replication_group_id is provided
variable "parameter_group_name" {
  type    = string
  default = null
}

variable "apply_immediately" {
  type    = bool
  default = null
}

variable "auto_minor_version_upgrade" {
  type    = bool
  default = null
}

variable "availability_zone" {
  type    = string
  default = null
}

variable "az_mode" {
  type    = string
  default = null
}

variable "engine_version" {
  type    = string
  default = null
}

# optional, Redis only
variable "final_snapshot_identifier" {
  type    = string
  default = null
}

variable "ip_discovery" {
  type    = string
  default = null
}

variable "log_delivery_configurations" {
  type = set(object({
    destination      = string
    destination_type = string
    log_format       = string
    log_type         = string
  }))
  default = null
}

variable "maintenance_window" {
  type    = string
  default = null
}

variable "network_type" {
  type    = string
  default = null
}

variable "notification_topic_arn" {
  type    = string
  default = null
}

variable "outpost_mode" {
  type    = string
  default = null
}

variable "port" {
  type      = number
  default   = null
  sensitive = true
}

# optional, Memcached only
variable "preferred_availability_zones" {
  type    = list(string)
  default = null
}

# optional, Required if outpost_mode is specified
variable "preferred_outpost_arn" {
  type    = string
  default = null
}

# optional, Required if engine is not specified
variable "replication_group_id" {
  type    = string
  default = null
}

variable "security_group_ids" {
  type    = list(string)
  default = null
}

# optional, Redis only
variable "snapshot_arns" {
  type    = list(string)
  default = null
}

# optional, Redis only
variable "snapshot_name" {
  type    = string
  default = null
}

# optional, Redis only
variable "snapshot_retention_limit" {
  type    = string
  default = null
}

# optional, Redis only
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
