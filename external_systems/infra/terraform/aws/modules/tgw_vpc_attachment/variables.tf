variable "prefix" {
  type = string
}

variable "environment" {
  type = string
}

variable "transit_gateway_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_attachment_appliance_mode_support" {
  type = string
}

variable "vpc_attachment_dns_support" {
  type = string
}

variable "vpc_attachment_ipv6_support" {
  type = string
}

variable "tags" {
  type = map(string)
}