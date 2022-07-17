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
  #token = "$YC_TOKEN"
  #token = "t1.9euelZrGkZTKkcqayJabioqJkpuUmO3rnpWal8fPkpqdyceYyJiMmsmUm8jl8_ckdmRp-e9PIywv_N3z92QkYmn5708jLC_8zef1656VmouXmsfKi57LzZyXj82UisyM7_0.Pns3pW7SGa5FYtP4J23nGwgNqzoQDQVdjDYZ32jCmYYI5Iv0PcMoVma5keJJ_x4fhNQMbTWDCNZeWPORTVCwCw"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
  #zone      = "ru-central1-a"
}

#provider "yandex" {
#  token     = "<OAuth>"
#  zone      = "<default availability zone>"
#}