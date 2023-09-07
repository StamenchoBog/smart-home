/* Target group */

resource "aws_lb_target_group" "lb_tg" {
  name = var.name

  connection_termination = var.connection_termination
  deregistration_delay   = var.deregistration_delay

  dynamic "health_check" {
    for_each = var.health_check[*]

    content {
      enabled             = health_check.value["enabled"]
      healthy_threshold   = health_check.value["healthy_threshold"]
      unhealthy_threshold = health_check.value["unhealthy_threshold"]
      interval            = health_check.value["interval"]
      matcher             = health_check.value["matcher"]
      path                = health_check.value["path"]
      port                = health_check.value["port"]
      protocol            = health_check.value["protocol"]
      timeout             = health_check.value["timeout"]
    }
  }

  lambda_multi_value_headers_enabled = var.lambda_multi_value_headers_enabled
  load_balancing_algorithm_type      = var.load_balancing_algorithm_type

  port               = var.port
  preserve_client_ip = var.preserve_client_ip
  protocol_version   = var.protocol_version
  protocol           = var.protocol
  proxy_protocol_v2  = var.proxy_protocol_v2

  slow_start = var.slow_start

  dynamic "stickiness" {
    for_each = var.stickiness[*]

    content {
      type            = stickiness.value["type"]
      cookie_duration = stickiness.value["cookie_duration"]
      cookie_name     = stickiness.value["cookiet_name"]
      enabled         = stickiness.value["enabled"]
    }
  }

  dynamic "target_failover" {
    for_each = var.target_failover[*]

    content {
      on_deregistration = target_failover.value["on_deregistration"]
      on_unhealthy      = target_failover.value["on_unhealthy"]
    }
  }

  target_type = var.target_type

  ip_address_type = var.ip_address_type
  vpc_id          = var.vpc_id

  tags = merge(var.tags, {
    Environment = var.environment
  })
}
