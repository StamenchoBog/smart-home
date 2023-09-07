variable "environment" {
  type = string
}

variable "name" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = null
}

variable "path" {
  type    = string
  default = null
}

variable "policy" {
  # JSON formatted string
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
