variable "environment" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "name" {
  type = string
}

variable "metadata_options" {
  type = object({
    http_endpoint = string
    http_tokens   = string
  })
  default = {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}

variable "enable_ebs_optimized" {
  type    = bool
  default = true
}

variable "enable_root_block_device_encryption" {
  type    = bool
  default = true
}

variable "enable_instance_monitoring" {
  type = bool
}

variable "instance_profile_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ec2_security_groups_ids" {
  type = list(string)
}

variable "user_data" {
  type    = string
  default = null
}

variable "tags" {
  type = map(string)
}
