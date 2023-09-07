variable "environment" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "eks_version" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "cluster_service_ipv4_cidr" {
  type = string
}

variable "cluster_ip_family" {
  type = string
}

variable "cluster_endpoint_private_access" {
  type = string
}

variable "cluster_endpoint_public_access" {
  type = string
}

variable "role_arn" {
  type = string
}

variable "enabled_cluster_log_types" {
  type = list(string)
}

variable "public_access_cidrs" {
  type = list(string)
}

variable "eks_cluster_tags" {
  type = map(string)
}

variable "cloudwatch_log_group_tags" {
  type = map(string)
}
