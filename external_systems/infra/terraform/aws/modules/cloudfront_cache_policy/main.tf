/* CF cache policy */
resource "aws_cloudfront_cache_policy" "cf_cache_policy" {

  name        = var.name
  min_ttl     = var.min_ttl
  max_ttl     = var.max_ttl
  default_ttl = var.default_ttl
  comment     = var.comment

  parameters_in_cache_key_and_forwarded_to_origin {

    cookies_config {
      cookie_behavior = var.parameters_in_cache_key_and_forwarded_to_origin.cookies_config.cookie_behavior

      dynamic "cookies" {
        for_each = var.parameters_in_cache_key_and_forwarded_to_origin.cookies_config.cookies != null ? [var.parameters_in_cache_key_and_forwarded_to_origin.cookies_config.cookies] : []

        content {
          items = cookies.value.items
        }
      }
    }

    headers_config {
      header_behavior = var.parameters_in_cache_key_and_forwarded_to_origin.headers_config.header_behavior

      dynamic "headers" {
        for_each = var.parameters_in_cache_key_and_forwarded_to_origin.headers_config.headers != null ? [var.parameters_in_cache_key_and_forwarded_to_origin.headers_config.headers] : []

        content {
          items = headers.value.items
        }
      }

    }

    query_strings_config {
      query_string_behavior = var.parameters_in_cache_key_and_forwarded_to_origin.query_strings_config.query_string_behavior

      dynamic "query_strings" {
        for_each = var.parameters_in_cache_key_and_forwarded_to_origin.query_strings_config.query_strings != null ? [var.parameters_in_cache_key_and_forwarded_to_origin.query_strings_config.query_strings] : []

        content {
          items = query_strings.value.items
        }
      }
    }

    enable_accept_encoding_brotli = var.parameters_in_cache_key_and_forwarded_to_origin.enable_accept_encoding_brotli
    enable_accept_encoding_gzip   = var.parameters_in_cache_key_and_forwarded_to_origin.enable_accept_encoding_gzip
  }
}
