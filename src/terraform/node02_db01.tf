resource "yandex_compute_instance" "db01" {
  name                      = "db01-${terraform.workspace}"
  zone                      = "ru-central1-a"
  hostname                  = "db01.itili4.ru"
  allow_stopping_for_update = true

  resources {
    cores  = "${terraform.workspace == "prod" ? 4 : 2}"
    memory = "${terraform.workspace == "prod" ? 4 : 2}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.centos-7-base}"
      name        = "root-db01"
      type        = "network-nvme"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.lan-subnet-a.id}"
#    nat        = true
    ip_address = "192.168.101.12"
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = "${terraform.workspace == "prod" ? false : true}"
  }
}
