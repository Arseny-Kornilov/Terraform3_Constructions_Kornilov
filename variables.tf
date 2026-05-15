###cloud vars

variable "cloud_id" {
  type        = string
  default     = local.cloud_id
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = local.folder_id
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


variable "platform_id" {
  description = "Platform ID for instances"
  type        = string
  default     = "standard-v3"
}

variable "image_family" {
  description = "Image family for boot disk"
  type        = string
  default     = "ubuntu-2204-lts"
}


variable "common_resources" {
  type = object({
    cores  = number
    memory = number
  })
  default = {
    cores  = 2
    memory = 4
  }
}


###ssh vars

variable "vms_ssh_root_key" {
  type    = string
  default = "local.connection_defaults.private_key"
  description = "ssh-keygen -t ed25519"
}

variable "ssh_key_path" {
  type = string
  default = "/home/vboxuser/.ssh/new_key.pub"
  sensitive = true
}
