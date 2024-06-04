output "instances_info" {
  value = {
    for instance in [yandex_compute_instance.example-a, yandex_compute_instance.example-b] :
      instance.name => {
      instance_name = instance.name
      external_ip   = instance.network_interface.0.nat_ip_address
      fqdn          = instance.fqdn
    }
  }
}