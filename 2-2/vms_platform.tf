variable "vm_web_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона для ВМ web"
}
variable "vm_web_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "Сидр для ВМ web"
}

variable "vm_web_vpc_name" {
  type        = string
  default     = "web"
  description = "Имя подсети для ВМ web"
}

variable "vm_web_image_version" {
  description = "Версия Ubuntu"
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_web_name" {
  description = "Наименование для ВМ web"
  type = string
  default = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  description = "Платформа виртуализации(процессор)"
  type = string
  default = "standard-v1"
}

variable "vm_web_memory" {
  description = "Объем памяти для ВМ web"
  type = number
  default = "1"
}

variable "vm_web_cores" {
  description = "Количество ядер для ВМ web"
  type = number
  default = "2"
}

variable "vm_web_core_fraction" {
  description = "Доля ядра для ВМ web"
  type = number
  default = "5"
}

# variable "vm_web_image_id" {
#   type = string
#   default = data.yandex_compute_image.ubuntu.image_id
# }

variable "vm_web_preemptible" {
  description = "Прерываемая машина для ВМ web"
  type = bool
  default = true
}

# variable "vm_web_subnet_id" {
#   type = string
#   default = yandex_vpc_subnet.develop.id
# }

variable "vm_web_nat" {
  description = "Публичный IP для ВМ web"
  type = bool
  default = true
}

###########################################################################

variable "vm_db_default_zone" {
  description = "Зона для ВМ db"
  type        = string
  default     = "ru-central1-b"
}

variable "vm_db_default_cidr" {
  description = "Сидр для ВМ db"
  type        = list(string)
  default     = ["10.1.0.0/24"]
}

variable "vm_db_vpc_name" {
  description = "Имя подсети для ВМ db"
  type        = string
  default     = "db"
}

variable "vm_db_image_version" {
  description = "Версия Ubuntu для ВМ db"
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_db_name" {
  description = "Наименование для ВМ db"
  type = string
  default = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  description = "Платформа виртуализации(процессор)"
  type = string
  default = "standard-v1"
}

variable "vm_db_memory" {
  description = "Объем памяти для ВМ db"
  type = number
  default = "2"
}

variable "vm_db_cores" {
  description = "Количество ядер для ВМ db"
  type = number
  default = "2"
}

variable "vm_db_core_fraction" {
  description = "Доля ядра для ВМ db"
  type = number
  default = "20"
}

# variable "vm_db_image_id" {
#   type = string
#   default = data.yandex_compute_image.ubuntu.image_id
# }

variable "vm_db_preemptible" {
  description = "Прерываемая машина для ВМ db"
  type = bool
  default = true
}

# variable "vm_db_subnet_id" {
#   type = string
#   default = yandex_vpc_subnet.develop.id
# }

variable "vm_db_nat" {
  description = "Публичный IP для ВМ db"
  type = bool
  default = true
}