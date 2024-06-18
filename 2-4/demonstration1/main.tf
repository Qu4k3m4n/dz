#создаем облачную сеть
# resource "yandex_vpc_network" "develop" {
#   name = "develop"
# }

#создаем подсеть
# resource "yandex_vpc_subnet" "develop" {
#   name           = "develop-ru-central1-a"
#   zone           = "ru-central1-a"
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = ["10.0.1.0/24"]
# }
module "vpc_dev" {
  source       = "./modules/vpc"
  network_name = "develop"
  vpc_name     = "develop"
  default_zone = "ru-central1-a"
  default_cidr = "10.0.1.0/24"
}

data "yandex_vpc_network" "develop_network" {
  name       = module.vpc_dev.vpc_name
  depends_on = [module.vpc_dev]
}

data "yandex_vpc_subnet" "develop_subnet" {
  name       = "${module.vpc_dev.vpc_name}-${module.vpc_dev.default_zone}-a"
  depends_on = [module.vpc_dev]
}

module "marketing" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop"
  network_id     = data.yandex_vpc_network.develop_network.id
  subnet_zones   = var.default_zone
  subnet_ids     = [data.yandex_vpc_subnet.develop_subnet.id]
  instance_name  = "web"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true
  labels         = { project = "marketing" }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}


module "analytics" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "stage"
  network_id     = data.yandex_vpc_network.develop_network.id
  subnet_zones   = var.default_zone
  subnet_ids     = [data.yandex_vpc_subnet.develop_subnet.id]
  instance_name  = "web-stage"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true
  labels         = { project = "analytics" }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_authorized_key = var.public_key
  }
}

output "subnet_id_from_module" {
  value = module.vpc_dev.subnet.id
}

output "vpc_name_from_module" {
  value = module.vpc_dev.vpc_name
}