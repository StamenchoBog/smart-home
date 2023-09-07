variable "bucket_id" {
  type = string
}

variable "expected_bucket_owner" {
  type    = string
  default = null
}

variable "rules" {
  type = list(object({
    id     = string
    status = string
    abort_incomplete_multipart_upload = optional(object({
      days_after_initiation = number
    }))
    expiration = optional(object({
      date                         = optional(string)
      days                         = optional(number)
      expired_object_delete_marker = optional(bool)
    }))
    filter = optional(object({
      and = optional(object({
        object_size_greater_than = optional(number)
        object_size_less_than    = optional(number)
        prefix                   = optional(string)
        tags                     = optional(map(string))
      }))
      object_size_greater_than = optional(number)
      object_size_less_than    = optional(number)
      prefix                   = optional(string)
      tag = optional(object({
        key   = string
        value = string
      }))
    }))
    noncurrent_version_expiration = optional(object({
      newer_noncurrent_versions = optional(number)
      noncurrent_days           = optional(number)
    }))
    noncurrent_version_transition = optional(object({
      newer_noncurrent_versions = optional(number)
      noncurrent_days           = optional(number)
      storage_class             = string
    }))
    transitions = optional(list(object({
      date          = optional(string)
      days          = optional(number)
      storage_class = string
    })))
  }))
}
