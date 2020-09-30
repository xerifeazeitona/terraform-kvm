resource "libvirt_domain" "section7A" {
  name   = var.name
  vcpu   = var.vcpu
  memory = var.memory
}