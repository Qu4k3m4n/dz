resource "yandex_compute_instance" "web_server" {
  depends_on                = [resource.yandex_compute_instance.db_server]
  count                     = var.web_resources.web.count
  name                      = "web-${count.index + 1}"
  allow_stopping_for_update = var.stopping_for_update
  platform_id               = var.vm_platform_id

  resources {
    cores         = var.web_resources.web.cores
    memory        = var.web_resources.web.memory
    core_fraction = var.web_resources.web.core_fraction
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
}
