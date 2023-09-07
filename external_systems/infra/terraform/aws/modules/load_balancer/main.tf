/* Load balancer */

resource "aws_lb" "lb" {
  name = var.name

  internal           = var.internal
  load_balancer_type = var.load_balancer_type

  security_groups = var.security_groups

  drop_invalid_header_fields = var.drop_invalid_header_fields
  preserve_host_header       = var.preserve_host_header
  dynamic "access_logs" {
    for_each = var.access_logs[*]

    content {
      bucket  = access_logs.value.bucket
      prefix  = access_logs.value.prefix
      enabled = access_logs.value.enabled
    }
  }

  subnets = var.subnets

  dynamic "subnet_mapping" {
    for_each = var.subnet_mappings

    content {
      subnet_id            = subnet_mapping.value.subnet_id
      allocation_id        = subnet_mapping.value.allocation_id
      private_ipv4_address = subnet_mapping.value.private_ipv4_address
      ipv6_address         = subnet_mapping.value.ipv6_address
    }
  }

  idle_timeout = var.idle_timeout

  enable_deletion_protection       = var.enable_deletion_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_http2                     = var.enable_http2
  enable_waf_fail_open             = var.enable_waf_fail_open

  customer_owned_ipv4_pool = var.customer_owned_ipv4_pool
  ip_address_type          = var.ip_address_type

  desync_mitigation_mode = var.desync_mitigation_mode

  tags = merge(var.tags, {
    Environment = var.environment
  })
}
