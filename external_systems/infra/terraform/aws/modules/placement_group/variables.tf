variable "environment" {
  type = string
}

# Optional if you want to override generated name
variable "name" {
  type    = string
  default = null
}

variable "strategy" {
  type = string
}

variable "partition_count" {
  type    = number
  default = null
}

variable "spread_level" {
  type    = string
  default = null
}

variable "tags" {
  type = map(string)
}



