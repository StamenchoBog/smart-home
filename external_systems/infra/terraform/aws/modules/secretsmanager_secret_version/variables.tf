variable "secret_id" {
  type = string
}

variable "secret_string" {
  type    = string
  default = null
}

variable "secret_binary" {
  type    = string
  default = null
}

variable "version_stages" {
  type    = list(string)
  default = null
}
