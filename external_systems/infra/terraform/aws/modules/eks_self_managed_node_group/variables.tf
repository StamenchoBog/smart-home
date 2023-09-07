variable "environment" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "eks_version" {
  type = string
}

variable "eks_endpoint" {
  type = string
}

variable "eks_authority" {
  type = string
}

variable "worker_pools" {
  type = any
  # type = list(object({
  #   max_size      = number,
  #   min_size      = number,
  #   instance_type = string
  # }))
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "instance_profile" {
  type = string
}

variable "lt_tags" {
  type = map(string)
}