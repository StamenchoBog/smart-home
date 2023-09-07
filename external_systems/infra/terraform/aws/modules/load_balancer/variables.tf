variable "environment" {
  type = string
}

variable "name" {
  type    = string
  default = null
}

variable "internal" {
  type    = bool
  default = null
}

variable "load_balancer_type" {
  type    = string
  default = null
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "drop_invalid_header_fields" {
  type    = bool
  default = null
}

variable "preserve_host_header" {
  type    = bool
  default = null
}

variable "access_logs" {
  type = object({
    bucket  = string
    prefix  = optional(string)
    enabled = optional(bool)
  })
  default = null
}

variable "subnets" {
  type    = list(string)
  default = null
}

variable "subnet_mappings" {
  type = list(object({
    subnet_id            = string
    allocation_id        = optional(string)
    private_ipv4_address = optional(string)
    ipv6_address         = optional(string)
  }))
  default = []
}

variable "idle_timeout" {
  type    = number
  default = null
}

variable "enable_deletion_protection" {
  type    = bool
  default = true
}

variable "enable_cross_zone_load_balancing" {
  type    = bool
  default = null
}

variable "enable_http2" {
  type    = bool
  default = null
}

variable "enable_waf_fail_open" {
  type    = bool
  default = null
}

variable "customer_owned_ipv4_pool" {
  type    = string
  default = null
}

variable "ip_address_type" {
  type    = string
  default = null
}

variable "desync_mitigation_mode" {
  type    = string
  default = null
}

variable "tags" {
  type = map(string)
}
