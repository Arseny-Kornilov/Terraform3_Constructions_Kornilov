resource"yandex_compute_instance" "web" {
  count = 2
  depends_on = [yandex_compute_instance.db]

  name = "vm-web-${count.index}"
  platform_id = "standard-v3"
  zone = var.default_zone

  boot_disk {
    initialize_params {
      image_id = "fd84nt41ssoaapgql97p"
      size     = 8
    }
  }
  
  resources {
    cores  = 2
    memory = 4
  }

  network_interface {
    index     = 0
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = local.common_metadata

}
