variable "name" {
  type = string
}

variable "path" {
  type    = string
  default = null
}

variable "permissions_boundary" {
  type    = string
  default = null
}

variable "force_destroy" {
  type    = bool
  default = null
}

variable "tags" {
  type = map(string)
}
