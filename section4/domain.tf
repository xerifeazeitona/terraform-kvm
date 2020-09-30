resource "libvirt_domain" "section4" {
  name   = var.name
  vcpu   = var.vcpu
  memory = var.memory
}