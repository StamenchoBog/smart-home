variable "compute_platform" {
  type    = string
  default = null
}

variable "name" {
  type    = string
  default = null
}

variable "environment" {
  type    = string
  default = null
}

variable "tags" {
  type = map(string)
}