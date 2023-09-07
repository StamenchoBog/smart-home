variable "environment" {
  type = string
}

variable "description" {
  type    = string
  default = null
}

variable "kms_key_id" {
  type    = string
  default = null
}

variable "name" {
  type = string
}

variable "policy" {
  type    = string
  default = null
}

variable "recovery_window_in_days" {
  type    = number
  default = null
}

variable "replica" {
  type = object({
    kms_key_id = optional(string)
    region     = string
  })
  default = null
}

variable "force_overwrite_replica_secret" {
  type    = bool
  default = null
}

variable "tags" {
  type = map(string)
}
