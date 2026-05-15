variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number }))
  default = [
    { vm_name = "main", cpu = 6, ram = 12, disk_volume = 50 }, 
    { vm_name = "replica", cpu = 4, ram = 8, disk_volume = 30 }
  ]  
}

resource "yandex_compute_instance" "db" {
  count = length(var.each_vm)
  name = var.each_vm[count.index].vm_name
  
  resources {
    cores  = var.each_vm[count.index].cpu
    memory = var.each_vm[count.index].ram
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.os.id
      size = var.each_vm[count.index].disk_volume
    }
  }

  network_interface {
    index     = 0
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = local.common_metadata

}
  
