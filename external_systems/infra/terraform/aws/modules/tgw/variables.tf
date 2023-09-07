variable "prefix" {
  description = "Prefix for the infrastructure"
  type        = string
}

variable "environment" {
  description = "AWS account in which we are deploying"
  type        = string
}

variable "auto_accept_shared_attachments" {
  type    = string
  default = "disable"
}

variable "tags" {
  type = map(string)
}