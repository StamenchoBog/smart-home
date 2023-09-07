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

variable "subnet_ids" {
  type = set(string)
}

variable "tags" {
  type = map(string)
}
