variable "environment" {
  type = string
}

variable "file_system_id" {
  type = string
}

variable "posix_user" {
  type = object({
    gid            = number
    secondary_gids = optional(set(number))
    uid            = number
  })
  default = null
}

variable "root_directory" {
  type = object({
    creation_info = optional(object({
      owner_gid = number
      owner_uid = number
      # permissions: format of an octal number representing the file's mode bits
      permissions = string
    }))
    path = optional(string)
  })
  default = null
}

variable "tags" {
  type = map(string)
}