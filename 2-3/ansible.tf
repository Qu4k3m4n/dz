resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tpl",
    {
      webservers = yandex_compute_instance.web_server,
      databases  = yandex_compute_instance.db_server,
      storage    = yandex_compute_instance.storage
    }
  )
  filename = "inventory.ini"
}