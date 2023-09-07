variable "environment" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "bucket_block_public_acls" {
  type    = bool
  default = true
}

variable "bucket_block_public_policy" {
  type    = bool
  default = true
}

variable "bucket_ignore_public_acls" {
  type    = bool
  default = true
}

variable "bucket_restrict_public_buckets" {
  type    = bool
  default = true
}

variable "bucket_versioning" {
  type = string
}

variable "bucket_logging" {
  type = object({
    enabled = bool
    configuration = optional(object({
      target_prefix = string
    }))
  })
  validation {
    condition     = (var.bucket_logging.enabled == true && var.bucket_logging.configuration != null) || (var.bucket_logging.enabled == false && var.bucket_logging.configuration == null)
    error_message = "Variable bucket_logging in S3 module must be configured properly."
  }
}

variable "bucket_encryption" {
  type = object({
    enabled   = bool
    key_alias = optional(string)
    configuration = optional(object({
      deletion_window_in_days = number
      enable_key_rotation     = bool
    }))
  })
  validation {
    condition     = (var.bucket_encryption.enabled == true && var.bucket_encryption.configuration != null) || (var.bucket_encryption.enabled == false && var.bucket_encryption.configuration == null)
    error_message = "Variable bucket_encryption in S3 module must be configured properly."
  }
}

variable "tags" {
  type = map(string)
}
