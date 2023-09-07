variable "environment" {
  type = string
}

variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = null
}

variable "subnet_ids" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}
