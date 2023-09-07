variable "environment" {
  type = string
}

variable "role_name" {
  type = string
}

variable "assume_role_principal_type" {
  type = string
}

variable "assume_role_principal_identifiers" {
  type = list(string)
}

variable "managed_policy_arns" {
  type = list(string)
  # To make variable optional
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
