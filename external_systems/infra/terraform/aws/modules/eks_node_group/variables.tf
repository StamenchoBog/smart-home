variable "environment" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "node_group_name" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "capacity_type" {
  type = string
}

variable "instance_types" {
  type = list(string)
}

variable "desired_size" {
  type = string
}

variable "max_size" {
  type = string
}
variable "min_size" {
  type = string
}

variable "autoscaling_average_cpu" {
  type = string
}

variable "security_group" {
  type = list(string)
}

variable "ec2_ssh_key" {
  type = string
}

variable "tags" {
  type = map(string)
}
