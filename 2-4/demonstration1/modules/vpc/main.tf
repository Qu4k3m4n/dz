terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.5"
}

resource "yandex_vpc_network" "default" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "default" {
  name = "${var.vpc_name}-${var.default_zone}-a"
  zone = var.default_zone
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = [var.default_cidr]
}

variable "network_name" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "default_zone" {
  type = string
}

variable "default_cidr" {
  type = string
}

output "subnet" {
  value = yandex_vpc_subnet.default
}

output "vpc_name" {
  value = yandex_vpc_network.default.name
}

output "default_zone" {
  value = var.default_zone
}