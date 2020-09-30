resource "libvirt_domain" "controller" {
  name   = "${var.name}-${var.environment}"
  vcpu   = var.vcpu
  memory = var.memory

  network_interface {
    network_id = libvirt_network.networkA.id
  }
}