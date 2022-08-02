resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 60"
  }

  depends_on = [
    local_file.inventory
  ]
}

resource "null_resource" "execute_provisioning" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ANSIBLE_LOG_PATH='../log/trace.log' ansible-playbook -f 10 -T 60 -i ../ansible/inventory ../ansible/mainplaybook.yml"
  }

  depends_on = [
    null_resource.wait
  ]
}

