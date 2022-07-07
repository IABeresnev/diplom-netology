output "internal_ip_address_rproxy" {
  value = "${yandex_compute_instance.rproxy.network_interface.0.ip_address}"
}

output "external_ip_address_rproxy" {
  value = "${yandex_compute_instance.rproxy.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_db01" {
  value = "${yandex_compute_instance.db01.network_interface.0.ip_address}"
}

output "external_ip_address_db01" {
  value = "${yandex_compute_instance.db01.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_db02" {
  value = "${yandex_compute_instance.db02.network_interface.0.ip_address}"
}

output "external_ip_address_db02" {
  value = "${yandex_compute_instance.db02.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_gitlab" {
  value = "${yandex_compute_instance.gitlab.network_interface.0.ip_address}"
}

output "external_ip_address_gitlab" {
  value = "${yandex_compute_instance.gitlab.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_grunner" {
  value = "${yandex_compute_instance.grunner.network_interface.0.ip_address}"
}

output "external_ip_address_grunner" {
  value = "${yandex_compute_instance.grunner.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_gpa" {
  value = "${yandex_compute_instance.gpa.network_interface.0.ip_address}"
}

output "external_ip_address_gpa" {
  value = "${yandex_compute_instance.gpa.network_interface.0.nat_ip_address}"
}
