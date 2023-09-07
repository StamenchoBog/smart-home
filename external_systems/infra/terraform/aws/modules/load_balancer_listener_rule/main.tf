/* Load balancer listener rule */

resource "aws_lb_listener_rule" "lb_listener_rule" {
  listener_arn = var.listener_arn

  priority = var.priority

  dynamic "action" {
    for_each = var.actions

    content {
      type             = action.value["type"]
      target_group_arn = action.value["target_group_arn"]

      # Fixed-response block configuration
      dynamic "fixed_response" {
        for_each = action.value["fixed_response"][*]

        content {
          content_type = fixed_response.value["content_type"]
          message_body = fixed_response.value["message_body"]
          status_code  = fixed_response.value["status_code"]
        }
      }

      # Forward block configuration
      dynamic "forward" {
        for_each = action.value["forward"][*]

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
        for_each = action.value["redirect"][*]

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

  dynamic "condition" {
    for_each = var.conditions

    content {
      # Host header
      dynamic "host_header" {
        for_each = condition.value["host_header"][*]

        content {
          values = host_header.value["values"]
        }
      }

      # HTTP header
      dynamic "http_header" {
        for_each = condition.value["http_headers"] == null ? [] : condition.value["http_headers"]

        content {
          http_header_name = http_header.value["http_header_name"]
          values           = http_header.value["values"]
        }
      }

      # HTTP request method
      dynamic "http_request_method" {
        for_each = condition.value["http_request_method"][*]

        content {
          values = http_request_method.value["values"]
        }
      }

      # Path pattern
      dynamic "path_pattern" {
        for_each = condition.value["path_pattern"][*]

        content {
          values = path_pattern.value["values"]
        }
      }

      # Query string
      dynamic "query_string" {
        for_each = condition.value["query_strings"] == null ? [] : condition.value["query_strings"]

        content {
          key   = query_string.value["key"]
          value = query_string.value["value"]
        }
      }

      # Source IP
      dynamic "source_ip" {
        for_each = condition.value["source_ip"][*]

        content {
          values = source_ip.value["values"]
        }
      }
    }
  }

  tags = merge(var.tags, {
    Environment = var.environment
  })
}