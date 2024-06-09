resource "yandex_compute_disk" "storage_disks" {
  count = 3
  name  = "storage-disk-${count.index + 1}"
  size  = 1
  # type = network-hdd по умолчанию
  zone      = var.default_zone
  folder_id = var.folder_id
}

resource "yandex_compute_instance" "storage" {
  name                      = "storage"
  allow_stopping_for_update = true
  platform_id               = "standard-v1"
  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  scheduling_policy {
    preemptible = true
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