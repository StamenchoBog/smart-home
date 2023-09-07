variable "name" {
  type = string
}

variable "comment" {
  type    = string
  default = null
}

variable "cors_config" {
  type = object({
    access_control_allow_credentials = bool
    access_control_allow_headers = object({
      items = list(string)
    })
    access_control_allow_methods = object({
      items = list(string)
    })
    access_control_allow_origins = object({
      items = list(string)
    })
    access_control_expose_headers = optional(object({
      items = list(string)
    }))
    access_control_max_age_sec = optional(number)
    origin_override            = bool
  })
  default = null
}

variable "custom_headers_config" {
  type = object({
    items = object({
      header   = string
      override = bool
      value    = string
    })
  })
  default = null
}

variable "security_headers_config" {
  type = object({
    content_security_policy = optional(object({
      content_security_policy = string
      override                = bool
    }))
    content_type_options = optional(object({
      override = bool
    }))
    frame_options = optional(object({
      frame_option = string
      override     = bool
    }))
    referrer_policy = optional(object({
      referrer_policy = string
      override        = bool
    }))
    strict_transport_security = optional(object({
      access_control_max_age_sec = number
      include_subdomains         = optional(bool)
      override                   = bool
      preload                    = optional(bool)
    }))
    xss_protection = optional(object({
      mode_block = bool
      override   = bool
      protection = bool
      report_uri = optional(string)
    }))
  })
  default = {
    strict_transport_security = {
      access_control_max_age_sec = 31536000
      include_subdomains         = true
      override                   = true
      preload                    = true
    }
  }
}

variable "server_timing_headers_config" {
  type = object({
    enabled       = bool
    sampling_rate = number
  })
  default = null
}
