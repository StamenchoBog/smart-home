variable "name" {
  type = string
}

variable "min_ttl" {
  type = number
}

variable "max_ttl" {
  type    = number
  default = null
}

variable "default_ttl" {
  type    = number
  default = null
}

variable "comment" {
  type = string
}

variable "parameters_in_cache_key_and_forwarded_to_origin" {
  type = object({
    cookies_config = object({
      cookie_behavior = string
      cookies = optional(object({
        items = list(string)
      }))
    })
    headers_config = object({
      header_behavior = string
      headers = optional(object({
        items = list(string)
      }))
    })
    query_strings_config = object({
      query_string_behavior = string
      query_strings = optional(object({
        items = list(string)
      }))
    })
    enable_accept_encoding_brotli = optional(bool)
    enable_accept_encoding_gzip   = optional(bool)
  })
}
