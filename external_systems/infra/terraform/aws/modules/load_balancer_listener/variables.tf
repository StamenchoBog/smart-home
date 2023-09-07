variable "environment" {
  type = string
}

variable "load_balancer_arn" {
  type = string
}

variable "default_actions" {
  type = set(object({
    type             = string
    order            = optional(number)
    target_group_arn = optional(string)

    # Blocks
    fixed_response = optional(object({
      content_type = string
      message_body = optional(string)
      status_code  = optional(number)
    }))
    forward = optional(object({
      target_groups = set(object({
        arn    = string
        weight = optional(number)
      }))
      stickiness = optional(object({
        duration = number
        enabled  = optional(bool)
      }))
    }))
    redirect = optional(object({
      status_code = string
      host        = optional(string)
      path        = optional(string)
      port        = optional(string)
      protocol    = optional(string)
      query       = optional(string)
    }))
  }))
}


variable "alpn_policy" {
  type    = string
  default = null
}

variable "certificate_arn" {
  type    = string
  default = null
}

variable "port" {
  type    = number
  default = null
}

variable "protocol" {
  type    = string
  default = null
}

variable "ssl_policy" {
  type    = string
  default = null
}

variable "tags" {
  type = map(string)
}