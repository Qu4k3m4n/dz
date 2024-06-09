##########global##########

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

variable "nat" {
  type = bool
  default = "true"
}

variable "preemptible" {
  type    = bool
  default = "true"
}

variable "stopping_for_update" {
  type    = bool
  default = "true"
}

variable "vm_platform_id" {
  description = "Платформа виртуализации(процессор)"
  type = string
  default = "standard-v1"
}



##########web##########

variable "web_resources" {
  type = map(object({
    count         = number
    cores         = number
    memory        = number
    core_fraction = number
  }))
  description = "Ресурсы для виртуальных машин"
  default = {
    web = {
      count         = 2
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
  }
}



##########disk##########

variable "disk_resources" {
  type = map(object({
    count_disk    = number
    size          = number
    cores         = number
    memory        = number
    core_fraction = number
  }))
  description = "Ресурсы для виртуальных машин"
  default = {
    disk = {
      count_disk    = 3
      size          = 1
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
  }
}



##########db##########

variable "each_vm" {
  type = list(object({
    vm_name = string
    cpu     = number
    ram     = number
    core    = number #Добавил, чтобы не создавались дорогие с исп. цпу 100%
    disk    = number
  }))

  default = [
    {
      vm_name = "db-main"
      cpu     = 4
      ram     = 4
      core    = 20
      disk    = 25
    },
    {
      vm_name = "db-replica"
      cpu     = 2
      ram     = 2
      core    = 5
      disk    = 5
    },
  ]
}