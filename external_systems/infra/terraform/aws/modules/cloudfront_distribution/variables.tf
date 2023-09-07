variable "environment" {
  type = string
}

variable "aliases" {
  type    = list(string)
  default = null
}

variable "comment" {
  type    = string
  default = null
}

variable "custom_error_response" {
  type = list(object({
    error_caching_min_ttl = optional(number)
    error_code            = number
    response_code         = optional(number)
    response_page_path    = optional(string)
  }))
  default = null
}

variable "default_cache_behavior" {
  type = object({
    allowed_methods           = list(string)
    cached_methods            = list(string)
    cache_policy_id           = optional(string)
    compress                  = optional(bool)
    default_ttl               = optional(number)
    field_level_encryption_id = optional(string)
    forwarded_values = optional(object({
      cookies = object({
        forward           = string
        whitelisted_names = optional(list(string))
      })
      headers                 = optional(list(string))
      query_string            = bool
      query_string_cache_keys = optional(list(string))
    }))
    lambda_function_associations = optional(list(object({
      event_type   = string
      lambda_arn   = string
      include_body = optional(bool)
    })))
    function_associations = optional(list(object({
      event_type   = string
      function_arn = string
    })))
    max_ttl                    = optional(number)
    min_ttl                    = optional(number)
    origin_request_policy_id   = optional(string)
    realtime_log_config_arn    = optional(string)
    response_headers_policy_id = optional(string)
    smooth_streaming           = optional(bool)
    target_origin_id           = string
    trusted_key_groups         = optional(list(string))
    trusted_signers            = optional(list(string))
    viewer_protocol_policy     = string
  })
}

variable "default_root_object" {
  type    = string
  default = null
}

variable "enabled" {
  type = bool
}

variable "is_ipv6_enabled" {
  type    = bool
  default = null
}

variable "http_version" {
  type    = string
  default = null
}

variable "logging_config" {
  type = object({
    bucket          = string
    include_cookies = optional(bool)
    prefix          = optional(string)
  })
  default = null
}

variable "ordered_cache_behaviors" {
  type = list(object({
    allowed_methods           = list(string)
    cached_methods            = list(string)
    cache_policy_id           = optional(string)
    compress                  = optional(bool)
    default_ttl               = optional(number)
    field_level_encryption_id = optional(string)
    forwarded_values = optional(object({
      cookies = object({
        forward           = string
        whitelisted_names = optional(list(string))
      })
      headers                 = optional(list(string))
      query_string            = bool
      query_string_cache_keys = optional(list(string))
    }))
    lambda_function_associations = optional(list(object({
      event_type   = string
      lambda_arn   = string
      include_body = optional(bool)
    })))
    function_associations = optional(list(object({
      event_type   = string
      function_arn = string
    })))
    max_ttl                    = optional(number)
    min_ttl                    = optional(number)
    origin_request_policy_id   = optional(string)
    path_pattern               = string
    realtime_log_config_arn    = optional(string)
    response_headers_policy_id = optional(string)
    smooth_streaming           = optional(bool)
    target_origin_id           = string
    trusted_key_groups         = optional(list(string))
    trusted_signers            = optional(list(string))
    viewer_protocol_policy     = string
  }))
  default = null
}

variable "origins" {
  type = list(object({
    connection_attempts = optional(number)
    connection_timeout  = optional(number)
    custom_origin_config = object({
      http_port                = number
      https_port               = number
      origin_protocol_policy   = string
      origin_ssl_protocols     = list(string)
      origin_keepalive_timeout = optional(number)
      origin_read_timeout      = optional(number)
    })
    domain_name = string
    custom_headers = optional(list(object({
      name  = string
      value = string
    })))
    origin_access_control_id = optional(string)
    origin_id                = string
    origin_path              = optional(string)
    origin_shield = optional(object({
      enabled              = bool
      origin_shield_region = string
    }))
    s3_origin_config = optional(object({
      origin_access_identity = string
    }))
  }))
}

variable "origin_groups" {
  type = list(object({
    origin_id = string
    failover_criteria = object({
      status_codes = list(string)
    })
    members = list(object({
      origin_id = string
    }))
  }))
  default = null
}

variable "price_class" {
  type    = string
  default = null
}

variable "restrictions" {
  type = object({
    geo_restriction = object({
      locations        = list(string)
      restriction_type = string
    })
  })
}

variable "tags" {
  type = map(string)
}

variable "viewer_certificate" {
  type = object({
    # Specify acm_certificate_arn, cloudfront_default_certificate or iam_certificate_id
    acm_certificate_arn            = optional(string)
    cloudfront_default_certificate = optional(bool)
    iam_certificate_id             = optional(string)
    minimum_protocol_version       = string
    ssl_support_method             = optional(string)
  })
  default = {
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.2_2018"
  }
}

variable "web_acl_id" {
  type    = string
  default = null
}

variable "retain_on_delete" {
  type    = bool
  default = null
}

variable "wait_for_deployment" {
  type    = bool
  default = null
}
