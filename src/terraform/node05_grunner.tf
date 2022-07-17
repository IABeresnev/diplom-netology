resource "yandex_compute_instance" "grunner" {
  name                      = "grunner"
  zone                      = "ru-central1-b"
  hostname                  = "grunner.itili4.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.centos-7-base}"
      name        = "root-grunner"
      type        = "network-nvme"
      size        = "40"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.lan-subnet-b.id}"
#    nat        = true
    ip_address = "192.168.102.15"
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }
}
