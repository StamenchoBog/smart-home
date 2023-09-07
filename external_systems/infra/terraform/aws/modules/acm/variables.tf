variable "prefix" {
  type = string
}

variable "environment" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "validation_method" {
  type = string
}

variable "subject_alternative_names" {
  type = list(string)
}
