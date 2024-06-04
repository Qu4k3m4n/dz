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

variable "project_name" {
  type = string
  default = "netology"
}

variable "environment" {
  type = string
  default = "dev"
}

