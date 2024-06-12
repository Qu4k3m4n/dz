terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.5"
}

provider "yandex" {
  # token                    = "do not use!!!"
  cloud_id                 = "b1guinec3j8ctarhm1co"
  folder_id                = "b1g0h87ckj5oh7nmotd6"
  service_account_key_file = file("~/.ssh/authorized_key.json")
  zone                     = "ru-central1-a" #(Optional) The default availability zone to operate under, if not specified by a given resource.
}
