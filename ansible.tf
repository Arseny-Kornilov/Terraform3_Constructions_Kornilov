data "yandex_compute_instance" "web" {
  count = 2
  instance_id = yandex_compute_instance.web[count.index].id
}

data "yandex_compute_instance" "databases" {
  for_each = {
    for idx, vm in yandex_compute_instance.db :
    vm.name => vm.id
  }
  instance_id = each.value
}

locals {
  databases_lcl = [
    for name, vm in data.yandex_compute_instance.databases : {
      name        = vm.name
      external_ip = vm.network_interface[0].nat_ip_address
      fqdn        = "${vm.name}.ru-central1.internal"
    }
  ]
}

data "yandex_compute_instance" "storage" {
  instance_id = yandex_compute_instance.storage.id
}

locals {
  webservers = [
    for i, vm in data.yandex_compute_instance.web : {
      name        = vm.name
      external_ip = vm.network_interface[0].nat_ip_address
      fqdn        = "${vm.name}.ru-central1.internal"  # или полное доменное имя
    }
  ]
  
  databases = [
    for name, vm in data.yandex_compute_instance.databases : {
      name        = vm.name
      external_ip = vm.network_interface[0].nat_ip_address
      fqdn        = "${vm.name}.ru-central1.internal"
    }
  ]
  
  storage_vms = [
    {
      name        = data.yandex_compute_instance.storage.name
      external_ip = data.yandex_compute_instance.storage.network_interface[0].nat_ip_address
      fqdn        = "${data.yandex_compute_instance.storage.name}.ru-central1.internal"
    }
  ]
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory.ini"
  content = templatefile("${path.module}/inventory.tmpl", {
    webservers = local.webservers
    databases  = local.databases
    storage    = local.storage_vms
  })
}
