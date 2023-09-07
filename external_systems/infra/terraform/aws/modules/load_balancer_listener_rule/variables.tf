variable "environment" {
  type = string
}

variable "listener_arn" {
  type = string
}

variable "priority" {
  type    = number
  default = null
}

variable "actions" {
  type = set(object({
    type             = string
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

variable "conditions" {
  type = set(object({
    host_header = optional(object({
      values = set(string)
    }))
    http_headers = optional(set(object({
      http_header_name = string
      values           = set(string)
    })))
    http_request_method = optional(object({
      values = set(string)
    }))
    path_pattern = optional(object({
      values = set(string)
    }))
    query_strings = optional(set(object({
      key   = optional(string)
      value = string
    })))
    source_ip = optional(object({
      values = set(string)
    }))
  }))
}

variable "tags" {
  type = map(string)
}
