variable "file_system_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ip_address" {
  type    = string
  default = null
}

variable "security_groups" {
  type    = list(string)
  default = null
}
