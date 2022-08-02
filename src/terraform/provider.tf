# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "diplom-bucket"
    region     = "ru-central1"
    key        = "terraform/terraform.tfstate"
    access_key = "YCAJELZI5zOAW2vJTgDV7UUbc"
    secret_key = "YCN8WGUE6cFjxTVG2TgHsEhn_3ZC7xMw3HssOCNz"

    skip_region_validation      = true
    skip_credentials_validation = true

  }
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
}
