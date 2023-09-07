variable "environment" {
  type = string
}

variable "availability_zone_name" {
  type    = string
  default = null
}

variable "creation_token" {
  type        = string
  default     = null
  description = "A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation."
}

variable "enable_encryption" {
  type    = bool
  default = null
}

variable "kms_key_id" {
  type    = string
  default = null
}

variable "performance_mode" {
  type    = string
  default = null
}

variable "throughput_mode" {
  type    = string
  default = null
}

variable "provisioned_throughput_in_mibps" {
  type    = number
  default = null
}

variable "lifecycle_policy" {
  type = object({
    transition_to_ia                    = optional(string)
    transition_to_primary_storage_class = optional(string)
  })
  default = null
}

variable "tags" {
  type = map(string)
}
