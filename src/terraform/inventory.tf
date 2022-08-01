resource "local_file" "inventory" {
  content = <<-DOC
    [nodes:children]
    frontend
    dbservers
    glservers
    runnerservers
    gpaservers
    dbha

    [reversproxy]
    rproxy.itili4.ru ansible_host=${yandex_compute_instance.rproxy.network_interface.0.nat_ip_address}
    [frontend]
    wordpress.itili4.ru ansible_host=${yandex_compute_instance.wordpress.network_interface.0.ip_address}
    [dbservers]
    db01.itili4.ru ansible_host=${yandex_compute_instance.db01.network_interface.0.ip_address}
    db02.itili4.ru ansible_host=${yandex_compute_instance.db02.network_interface.0.ip_address}
    [glservers]
    gitlab.itili4.ru ansible_host=${yandex_compute_instance.gitlab.network_interface.0.ip_address}
    [runnerservers]
    grunner.itili4.ru ansible_host=${yandex_compute_instance.grunner.network_interface.0.ip_address}
    [gpaservers]
    gpa.itili4.ru ansible_host=${yandex_compute_instance.gpa.network_interface.0.ip_address}
    [dbha]
    dbha.itili4.ru ansible_host=${yandex_compute_instance.dbha.network_interface.0.ip_address}

    [nodes:vars]
    ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand="ssh -W %h:%p -q centos@${yandex_compute_instance.rproxy.network_interface.0.nat_ip_address}"'
    ansible_ssh_user=centos
  
    [reversproxy:vars]
    ansible_ssh_common_args='-o StrictHostKeyChecking=no'
    ansible_ssh_user=centos
    ansible_ssh_private_key_file=/home/yolo/.ssh/id_rsa
    DOC
  filename = "../ansible/inventory"

  depends_on = [
    yandex_compute_instance.rproxy,
    yandex_compute_instance.db01,
    yandex_compute_instance.db02,
    yandex_compute_instance.dbha,
    yandex_compute_instance.gitlab,
    yandex_compute_instance.grunner,
    yandex_compute_instance.gpa
  ]
}
