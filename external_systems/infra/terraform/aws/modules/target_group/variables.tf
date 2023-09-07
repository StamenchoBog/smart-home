variable "environment" {
  type = string
}

# Optional if you want to override generated name
variable "name" {
  type = string
}

variable "connection_termination" {
  type    = bool
  default = null
}

variable "deregistration_delay" {
  type    = number
  default = null
}

variable "health_check" {
  type = object({
    enabled             = optional(bool)
    healthy_threshold   = optional(number)
    unhealthy_threshold = optional(number)
    interval            = optional(number)
    matcher             = optional(string)
    path                = optional(string)
    port                = optional(string)
    protocol            = optional(string)
    timeout             = optional(number)
  })
  default = null
}

variable "lambda_multi_value_headers_enabled" {
  type    = bool
  default = null
}

variable "load_balancing_algorithm_type" {
  type    = string
  default = null
}

variable "port" {
  type    = number
  default = null
}

variable "preserve_client_ip" {
  type    = bool
  default = null
}

variable "protocol_version" {
  type    = string
  default = null
}

variable "protocol" {
  type    = string
  default = null
}

variable "proxy_protocol_v2" {
  type    = bool
  default = null
}

variable "slow_start" {
  type    = number
  default = null
}

variable "stickiness" {
  type = object({
    type            = string
    cookie_duration = optional(number)
    cookie_name     = optional(string)
    enabled         = optional(bool)
  })
  default = null
}

variable "target_failover" {
  type = object({
    on_deregistration = optional(string)
    on_unhealthy      = optional(string)
  })
  default = null
}

variable "target_type" {
  type    = string
  default = null
}

variable "ip_address_type" {
  type    = string
  default = null
}

variable "vpc_id" {
  type    = string
  default = null
}

variable "tags" {
  type = map(string)
}

