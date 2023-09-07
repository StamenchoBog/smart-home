variable "alias" {
  type        = string
  description = "The display name of the alias. The name must start with the word 'alias' followed by a forward slash (alias/)"
}

variable "description" {
  type    = string
  default = null
}

variable "key_usage" {
  type    = string
  default = null
}

variable "custom_key_store_id" {
  type    = string
  default = null
}

variable "customer_master_key_spec" {
  type    = string
  default = null
}

variable "policy" {
  type    = string
  default = null
}

variable "bypass_policy_lockout_safety_check" {
  type    = bool
  default = null
}

variable "deletion_window_in_days" {
  type    = number
  default = null
}

variable "enable_key_rotation" {
  type    = bool
  default = null
}

variable "multi_region" {
  type    = bool
  default = null
}

variable "tags" {
  type = map(string)
}