variable "security_group_id" {
  type = string
}

variable "description" {
  type = string
}

variable "type" {
  type = string
}

variable "from_port" {
  type = number
}

variable "to_port" {
  type = number
}

variable "protocol" {
  type = string
}

variable "cidr_blocks" {
  type    = list(string)
  default = null
}

variable "ipv6_cidr_blocks" {
  type    = list(string)
  default = null
}

variable "source_security_group_id" {
  type    = string
  default = null
}