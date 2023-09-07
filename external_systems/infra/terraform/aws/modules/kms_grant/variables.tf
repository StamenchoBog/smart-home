variable "name" {
  type    = string
  default = null
}

variable "key_id" {
  type = string
}

variable "grantee_principal" {
  type = string
}

variable "operations" {
  type = set(string)
}

variable "retiring_principal" {
  type    = string
  default = null
}

variable "constraints" {
  type = object({
    encryption_context_equals = optional(map(string))
    encryption_context_subset = optional(map(string))
  })
  default = null
}

variable "grant_creation_tokens" {
  type    = set(string)
  default = null
}

variable "retire_on_delete" {
  type    = bool
  default = null
}
