variable "policy_id" {
  type    = string
  default = null
}

variable "override_policy_documents" {
  type    = list(string)
  default = null
}

variable "policy_version" {
  type    = string
  default = null
}

variable "source_policy_documents" {
  type    = list(string)
  default = null
}

variable "statements" {
  type = list(object({
    sid     = optional(string)
    actions = optional(list(string))
    effect  = optional(string)
    principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })))
    conditions = optional(list(object({
      test     = string
      variable = string
      values   = list(string)
    })))
    resources = optional(list(string))
  }))
  default = null
}
