terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "ssh://terraform@158.160.176.8"
}

resource "random_password" "mysql_root_password" {
  length  = 16
  special = true
}

resource "random_password" "mysql_password" {
  length  = 16
  special = true
}

resource "docker_container" "mysql" {
  image = "mirror.gcr.io/mysql:8"
  name  = "mysql_container"
  ports {
    internal = 3306
    external = 3306
    ip       = "127.0.0.1"
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.mysql_root_password.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.mysql_password.result}",
    "MYSQL_ROOT_HOST=%"
  ]
}