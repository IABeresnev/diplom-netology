resource "yandex_compute_instance" "dbha" {
  name                      = "dbha"
  zone                      = "ru-central1-a"
  hostname                  = "dbha.itili4.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.centos-7-base}"
      name        = "root-dbha"
      type        = "network-nvme"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.lan-subnet-a.id}"
#    nat        = true
    ip_address = "192.168.101.17"
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }
}
