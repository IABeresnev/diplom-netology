resource "yandex_compute_instance" "gpa" {
  name                      = "gpa-${terraform.workspace}"
  zone                      = "ru-central1-b"
  hostname                  = "gpa.itili4.ru"
  allow_stopping_for_update = true

  resources {
    cores  = "${terraform.workspace == "prod" ? 4 : 2}"
    memory = "${terraform.workspace == "prod" ? 4 : 2}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.centos-7-base}"
      name        = "root-gpa"
      type        = "network-nvme"
      size        = "40"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.lan-subnet-b.id}"
#    nat        = true
    ip_address = "192.168.102.16"
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = "${terraform.workspace == "prod" ? false : true}"
  }
}
