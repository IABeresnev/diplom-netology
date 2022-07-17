resource "yandex_compute_instance" "gpa" {
  name                      = "gpa"
  zone                      = "ru-central1-b"
  hostname                  = "gpa.itili4.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
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
    preemptible = true
  }
}
