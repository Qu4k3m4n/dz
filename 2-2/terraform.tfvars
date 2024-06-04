vms_resources = {
  web = {
    cores         = 2
    memory        = 1
    core_fraction = 5
  },
  db = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
}

common_metadata = {
  serial-port-enable = 1
  ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHMx6AhDUsS7LtY5mxNxMHUwEwWodwUIz7jumDOTrq6p quakeman@WIN-HKA0F9TV73I"
}