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
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHMx6AhDUsS7LtY5mxNxMHUwEwWodwUIz7jumDOTrq6p quakeman@WIN-HKA0F9TV73I"
  description = "ssh-keygen -t ed25519"
}
