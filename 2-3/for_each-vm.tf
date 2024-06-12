resource "yandex_compute_instance" "db_server" {
  for_each                  = { for vm in var.each_vm : vm.vm_name => vm }
  name                      = each.value.vm_name
  allow_stopping_for_update = var.stopping_for_update
  platform_id               = var.vm_platform_id
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
    preemptible = var.preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.nat
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_key_path)}"
  }
}
