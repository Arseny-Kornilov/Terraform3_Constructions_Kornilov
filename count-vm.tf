data "yandex_compute_image" "os" {
  family = var.image_family
}

resource"yandex_compute_instance" "web" {
  count = 2
  depends_on = [yandex_compute_instance.db]

  name = "vm-web-${count.index}"
  platform_id = var.platform_id
  zone = var.default_zone

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.os.id
      size     = 8
    }
  }
  
  resources {
    cores  = var.common_resources.cores
    memory = var.common_resources.memory
  }

  network_interface {
    index     = 0
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = local.common_metadata

}
