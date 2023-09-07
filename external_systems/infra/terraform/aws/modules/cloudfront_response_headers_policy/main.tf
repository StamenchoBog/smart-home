/* CloudFront Response Headers Policy */

resource "aws_cloudfront_response_headers_policy" "cf_response_headers_policy" {

  name    = var.name
  comment = var.comment

  dynamic "cors_config" {
    for_each = var.cors_config[*]

    content {
      access_control_allow_credentials = cors_config.value.access_control_allow_credentials
      access_control_max_age_sec       = cors_config.value.access_control_max_age_sec
      origin_override                  = cors_config.value.origin_override

      access_control_allow_headers {
        items = cors_config.value.access_control_allow_headers.items
      }
      access_control_allow_methods {
        items = cors_config.value.access_control_allow_methods.items
      }
      access_control_allow_origins {
        items = cors_config.value.access_control_allow_origins.items
      }
      dynamic "access_control_expose_headers" {
        for_each = cors_config.value.access_control_expose_headers[*]

        content {
          items = access_control_expose_headers.value.items
        }
      }
    }
  }

  dynamic "custom_headers_config" {
    for_each = var.custom_headers_config[*]

    content {
      items {
        header   = custom_headers_config.value.items.header
        override = custom_headers_config.value.items.override
        value    = custom_headers_config.value.items.value
      }
    }
  }

  security_headers_config {

    dynamic "content_security_policy" {
      for_each = var.security_headers_config.content_security_policy[*]
      content {
        content_security_policy = content_security_policy.value.content_security_policy
        override                = content_security_policy.value.override
      }
    }

    dynamic "content_type_options" {
      for_each = var.security_headers_config.content_type_options[*]
      content {
        override = content_type_options.value.override
      }
    }

    dynamic "frame_options" {
      for_each = var.security_headers_config.frame_options[*]
      content {
        frame_option = frame_options.value.frame_option
        override     = frame_options.value.override
      }
    }

    dynamic "referrer_policy" {
      for_each = var.security_headers_config.referrer_policy
      content {
        referrer_policy = referrer_policy.value.referrer_policy
        override        = referrer_policy.value.override
      }
    }

    strict_transport_security {
      access_control_max_age_sec = var.security_headers_config.strict_transport_security.access_control_max_age_sec
      include_subdomains         = var.security_headers_config.strict_transport_security.include_subdomains
      override                   = var.security_headers_config.strict_transport_security.override
      preload                    = var.security_headers_config.strict_transport_security.preload
    }

    dynamic "xss_protection" {
      for_each = var.security_headers_config.xss_protection[*]
      content {
        mode_block = xss_protection.value.mode_block
        override   = xss_protection.value.override
        protection = xss_protection.value.override
        report_uri = xss_protection.value.report_uri
      }
    }
  }

  dynamic "server_timing_headers_config" {
    for_each = var.server_timing_headers_config[*]

    content {
      enabled       = server_timing_headers_config.value.enabled
      sampling_rate = server_timing_headers_config.value.sampling_rate
    }
  }
}
