variable "environment" {
  type = string
}

variable "name" {
  type = string
}

variable "autoscaling_group_name" {
  type = string
}

variable "adjustment_type" {
  type    = string
  default = null
}

variable "policy_type" {
  type    = string
  default = null
}

variable "predictive_scaling_configuration" {
  type = object({
    max_capacity_breach_behavior = optional(string)
    max_capacity_buffer          = optional(number)
    metric_specification = object({
      # TODO
    })
    mode                   = optional(string)
    scheduling_buffer_time = optional(number)
  })
  default = null
}

variable "estimated_instance_warmup" {
  type    = number
  default = null
}

variable "enabled" {
  type    = bool
  default = null
}

# The following argument is only available to "SimpleScaling" and "StepScaling" type policies
variable "min_adjustment_magnitude" {
  type        = string
  default     = null
  description = "`min_adjustment_magnitude` is only available to 'SimpleScaling' and 'StepScaling' type policies"
}

# The following arguments are only available to "SimpleScaling" type policies
variable "cooldown" {
  type        = number
  default     = null
  description = "`cooldown` is only available to 'SimpleScaling' type policies"
}

variable "scaling_adjustment" {
  type        = number
  default     = null
  description = "`scaling_adjustment` is only available to 'SimpleScaling' type policies"
}

# The following arguments are only available to "StepScaling" type policies
variable "metric_aggregation_type" {
  type        = string
  default     = null
  description = "`metric_aggregation_type` is only available to 'StepScaling' type policies"
}

variable "step_adjustment" {
  type = object({
    scaling_adjustment          = number
    metric_interval_lower_bound = optional(number)
    metric_interval_upper_bound = optional(number)
  })
  default     = null
  description = "`step_adjustment` is only available to 'StepScaling' type policies"
}

# The following arguments are only available to "TargetTrackingScaling" type policies
variable "target_tracking_configuration" {
  type = object({
    target_value     = number
    disable_scale_in = optional(bool)
    predefined_metric_specification = optional(object({
      predefined_metric_type = string
      resource_label         = optional(string)
    }))
    customized_metric_specification = optional(object({
      metric_dimension = optional(object({
        name  = string
        value = string
      }))
      metric_name = optional(string)
      namespace   = optional(string)
      statistic   = optional(string)
      unit        = optional(string)
      metrics = optional(object({
        expression = optional(string)
        id         = string
        label      = optional(string)
        metric_stat = optional(object({
          metric = object({
            dimensions = optional(object({
              name  = string
              value = string
            }))
            metric_name = string
            namespace   = string
          })
          stat = optional(string)
          unit = optional(string)
        }))
        return_data = optional(bool)
      }))
    }))
  })
}