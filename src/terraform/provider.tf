# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

backend "s3" {
    bucket = "diplom-bucket"
    key = "terraform.tfstate"

    endpoint = "http://192.168.0.29:9000"

    access_key="TQBJdFEuvsxIgYWU"
    secret_key="3bQKav9eDbUuHOrcFklx70LhfyQiN0MQ"

    region = "main"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_region_validation = true
    force_path_style = true
  }
}

provider "yandex" {
  service_account_key_file = "key.json"
  #token = "$YC_TOKEN"
  #token = "t1.9euelZrGkZTKkcqayJabioqJkpuUmO3rnpWal8fPkpqdyceYyJiMmsmUm8jl8_ckdmRp-e9PIywv_N3z92QkYmn5708jLC_8zef1656VmouXmsfKi57LzZyXj82UisyM7_0.Pns3pW7SGa5FYtP4J23nGwgNqzoQDQVdjDYZ32jCmYYI5Iv0PcMoVma5keJJ_x4fhNQMbTWDCNZeWPORTVCwCw"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
  zone      = "ru-central1-a"
}

#provider "yandex" {
#  token     = "<OAuth>"
#  zone      = "<default availability zone>"
#}