resource "yandex_compute_instance" "wordpress" {
  name                      = "wordpress-${terraform.workspace}"
  zone                      = "ru-central1-a"
  hostname                  = "wordpress.itili4.ru"
  allow_stopping_for_update = true

  resources {
    cores  = "${terraform.workspace == "prod" ? 4 : 2}"
    memory = "${terraform.workspace == "prod" ? 4 : 2}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.centos-7-base}"
      name        = "root-wordpress"
      type        = "network-nvme"
      size        = "40"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.lan-subnet-a.id}"
#    nat        = true
    ip_address = "192.168.101.10"
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = "${terraform.workspace == "prod" ? false : true}"
  }
}
