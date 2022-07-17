# Network
resource "yandex_vpc_network" "default" {
  name = "net"
}

resource "yandex_vpc_subnet" "lan-subnet-a" {
  name = "lan-subnet-a"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["192.168.101.0/24"]
}

resource "yandex_vpc_subnet" "lan-subnet-b" {
  name = "lan-subnet-b"
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["192.168.102.0/24"]
}

resource "yandex_dns_recordset" "rs1" {
  zone_id = "${var.dns_zone_id}"
  name    = "itili4.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.rproxy.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "rs2" {
  zone_id = "${var.dns_zone_id}"
  name    = "www.itili4.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.rproxy.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "rs3" {
  zone_id = "${var.dns_zone_id}"
  name    = "gitlab.itili4.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.rproxy.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "rs4" {
  zone_id = "${var.dns_zone_id}"
  name    = "grafana.itili4.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.rproxy.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "rs5" {
  zone_id = "${var.dns_zone_id}"
  name    = "prometheus.itili4.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.rproxy.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "rs6" {
  zone_id = "${var.dns_zone_id}"
  name    = "alertmanager.itili4.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.rproxy.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "rs7" {
  zone_id = "${var.dns_zone_id}"
  name    = "wordpress.itili4.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.rproxy.network_interface.0.nat_ip_address}"]
}