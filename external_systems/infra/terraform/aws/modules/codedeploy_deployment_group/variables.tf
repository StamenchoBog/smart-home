variable "app_name" {
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

variable "codedeploy_role" {
  type    = string
  default = null
}

variable "asg_name" {
  type    = string
  default = null
}

variable "auto_rollback" {
  type    = bool
  default = null
}

variable "rollback_events" {
  type    = list(string)
  default = null
}

variable "tags" {
  type = map(string)
}