resource "yandex_compute_disk" "storage_disks" {
  count = var.disk_resources.disk.count_disk
  name  = "storage-disk-${count.index + 1}"
  size  = var.disk_resources.disk.size
  # type = network-hdd по умолчанию
  zone      = var.default_zone
  folder_id = var.folder_id
}

resource "yandex_compute_instance" "storage" {
  name                      = "storage"
  allow_stopping_for_update = var.stopping_for_update
  platform_id               = var.vm_platform_id
  resources {
    cores         = var.disk_resources.disk.cores
    memory        = var.disk_resources.disk.memory
    core_fraction = var.disk_resources.disk.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_key_path)}"
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disks
    content {
      disk_id = secondary_disk.value.id
    }
  }
}
