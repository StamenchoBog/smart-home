variable "placement_group_id" {
  type    = string
  default = null
}

variable "name" {
  type    = string
  default = null
}

variable "desired_capacity" {
  type    = number
  default = null
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "vpc_zone_identifier" {
  type    = list(string)
  default = null
}

variable "default_cooldown" {
  type    = number
  default = null
}

variable "default_instance_warmup" {
  type    = number
  default = null
}

variable "health_check_grace_period" {
  type    = number
  default = null
}

variable "health_check_type" {
  type    = string
  default = null
}

variable "force_delete" {
  type    = bool
  default = null
}

variable "target_group_arns" {
  type    = list(string)
  default = []
}

variable "termination_policies" {
  type    = list(string)
  default = []
}

variable "suspended_processes" {
  type    = list(string)
  default = []
}

variable "wait_for_capacity_timeout" {
  type    = string
  default = null
}

variable "min_elb_capacity" {
  type    = number
  default = null
}

variable "wait_for_elb_capacity" {
  type    = number
  default = null
}

variable "protect_from_scale_in" {
  type    = bool
  default = null
}

variable "service_linked_role_arn" {
  type    = string
  default = null
}

variable "launch_template" {
  type = object({
    id      = string
    version = string
  })
  default = null
}

variable "instance_refresh" {
  type = object({
    strategy = string
    preferences = optional(object({
      checkpoint_delay       = optional(number)
      checkpoint_percentages = optional(list(number))
      instance_warmup        = optional(number)
      min_healthy_percentage = optional(number)
      skip_matching          = optional(bool)
    }))
    triggers = optional(set(string))
  })
  default = null
}

variable "tags" {
  type = list(object({
    key                 = string
    value               = string
    propagate_at_launch = bool
  }))
  default = []
}
