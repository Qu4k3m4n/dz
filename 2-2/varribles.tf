###cloud vars
#variable "token" {
#  type        = string
#  description = "DO NOT USE"
#}

variable "cloud_id" {
  type        = string
  default = "b1guinec3j8ctarhm1co"
}

variable "folder_id" {
  type        = string
  default = "b1g0h87ckj5oh7nmotd6"
}

variable "default_zone" {
  type        = string
  default = "ru-central1-d"
}

variable "vm_dev_vpc_name" {
  type        = string
  default = "dev"
}
###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHMx6AhDUsS7LtY5mxNxMHUwEwWodwUIz7jumDOTrq6p quakeman@WIN-HKA0F9TV73I"
  description = "ssh-keygen -t ed25519"
}
