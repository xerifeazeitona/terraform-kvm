resource "libvirt_domain" "worker" {
  name   = "${var.name}-${var.environment}"
  vcpu   = var.vcpu
  memory = var.memory

  network_interface {
    network_id = var.controller_network_id
  }
}