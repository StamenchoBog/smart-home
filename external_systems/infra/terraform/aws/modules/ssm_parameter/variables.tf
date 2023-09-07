variable "environment" {
  type = string
}

variable "name" {
  type = string
}

variable "type" {
  type    = string
  default = "SecureString"
}

variable "allowed_pattern" {
  type    = string
  default = null
}

variable "data_type" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = null
}

variable "key_id" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = null
}

variable "tier" {
  type    = string
  default = null
}

variable "value" {
  type    = string
  default = null
}

