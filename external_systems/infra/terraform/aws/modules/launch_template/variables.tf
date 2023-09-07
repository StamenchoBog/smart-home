variable "environment" {
  type = string
}

# Optional if you want to override generated name with prefix and environment
variable "name" {
  type    = string
  default = null
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "user_data" {
  type    = string
  default = null
}

variable "default_version" {
  type    = number
  default = null
}

variable "update_default_version" {
  type    = bool
  default = null
}

variable "block_device_mappings" {
  type = object({
    device_name = string
    ebs = object({
      volume_size           = optional(number)
      encrypted             = optional(bool)
      delete_on_termination = optional(bool)
      snapshot_id           = optional(string)
      volume_type           = optional(string)
    })
  })
  default = null
}

variable "capacity_reservation_specification" {
  type = object({
    capacity_reservation_preference = optional(string)
    capacity_reservation_target = optional(object({
      capacity_reservation_id                 = string
      capacity_reservation_resource_group_arn = string
    }))
  })
  default = null
}

variable "cpu_options" {
  type = object({
    core_count       = number
    threads_per_core = number
  })
  default = null
}

variable "disable_api_stop" {
  type    = bool
  default = null
}

variable "disable_api_termination" {
  type    = bool
  default = null
}

variable "ebs_optimized" {
  type    = bool
  default = null
}

variable "elastic_gpu_specifications" {
  type = object({
    type = string
  })
  default = null
}

variable "elastic_inference_accelerator" {
  type = object({
    type = string
  })
  default = null
}

variable "iam_instance_profile" {
  type = object({
    arn  = optional(string)
    name = optional(string)
  })
  default = null
}

variable "image_id" {
  type    = string
  default = null
}

variable "instance_initiated_shutdown_behavior" {
  type    = string
  default = null
}

variable "instance_type" {
  type    = string
  default = null
}

variable "kernel_id" {
  type    = string
  default = null
}

variable "key_name" {
  type    = string
  default = null
}

variable "license_specifications" {
  type = list(object({
    license_configuration_arn = string
  }))
  default = []
}

variable "maintenance_options" {
  type = object({
    auto_recovery = optional(string)
  })
  default = null
}

variable "metadata_options" {
  type = object({
    http_endpoint               = optional(string)
    http_tokens                 = optional(string)
    http_put_response_hop_limit = optional(number)
    http_protocol_ipv6          = optional(string)
    instance_metadata_tags      = optional(string)
  })
  default = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }
}

variable "monitoring" {
  type = object({
    enabled = optional(bool)
  })
  default = null
}

variable "placement" {
  type = object({
    group_name              = optional(string)
    availability_zone       = optional(string)
    host_id                 = optional(string)
    host_resource_group_arn = optional(string)
    affinity                = optional(string)
    tenancy                 = string
    partition_number        = optional(string)
  })
  default = null
}

variable "ram_disk_id" {
  type    = string
  default = null
}

variable "tag_specifications" {
  type = list(object({
    resource_type = string
    tags          = map(string)
  }))
  default = []
}

variable "tags" {
  type = map(string)
}
