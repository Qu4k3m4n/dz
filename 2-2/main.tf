resource "yandex_vpc_network" "develop" {
  name = var.vm_dev_vpc_name
}
resource "yandex_vpc_subnet" "web" {
  name           = var.vm_web_vpc_name
  zone           = var.vm_web_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_web_default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_version
}

resource "yandex_compute_instance" "example-a" {
  name        = local.vm_names.web
  platform_id = var.vm_web_platform_id
  zone        = var.vm_web_default_zone
  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.web.id
    nat       = var.vm_web_nat
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

###########################################################################
resource "yandex_vpc_subnet" "db" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_default_cidr
}

resource "yandex_compute_instance" "example-b" {
  name        = local.vm_names.db
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_default_zone
  resources {
    cores         = var.vm_db_cores
    memory        = var.vm_db_memory
    core_fraction = var.vm_db_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db.id  # Используем ту же подсеть
    nat       = var.vm_db_nat
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

