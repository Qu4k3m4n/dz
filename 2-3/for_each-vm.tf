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

resource "yandex_compute_instance" "db_server" {
  for_each                  = { for vm in var.each_vm : vm.vm_name => vm }
  name                      = each.value.vm_name
  allow_stopping_for_update = true
  platform_id               = "standard-v1"
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_key_path)}"
  }
}