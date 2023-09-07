/* Load balancer listener */

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = var.load_balancer_arn

  dynamic "default_action" {
    for_each = var.default_actions

    content {
      type             = default_action.value["type"]
      order            = default_action.value["order"]
      target_group_arn = default_action.value["target_group_arn"]

      # Fixed-response block configuration
      dynamic "fixed_response" {
        for_each = default_action.value["fixed_response"][*]

        content {
          content_type = fixed_response.value["content_type"]
          message_body = fixed_response.value["message_body"]
          status_code  = fixed_response.value["status_code"]
        }
      }

      # Forward block configuration
      dynamic "forward" {
        for_each = default_action.value["forward"][*]

        content {
          dynamic "target_group" {
            for_each = forward.value["target_groups"]

            content {
              arn    = target_group.value["arn"]
              weight = target_group.value["weight"]
            }
          }
          dynamic "stickiness" {
            for_each = forward.value["stickiness"][*]

            content {
              duration = stickiness.value["duration"]
              enabled  = stickiness.value["enabled"]
            }
          }
        }
      }

      # Redirect block configuration
      dynamic "redirect" {
        for_each = default_action.value["redirect"][*]

        content {
          status_code = redirect.value["status_code"]
          host        = redirect.value["host"]
          path        = redirect.value["path"]
          port        = redirect.value["port"]
          protocol    = redirect.value["protocol"]
          query       = redirect.value["query"]
        }
      }
    }
  }

  alpn_policy = var.alpn_policy

  certificate_arn = var.certificate_arn
  protocol        = var.protocol
  ssl_policy      = var.ssl_policy
  port            = var.port

  tags = merge(var.tags, {
    Environment = var.environment
  })
}
