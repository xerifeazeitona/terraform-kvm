resource "libvirt_domain" "section6" {
  name   = var.name
  vcpu   = var.vcpu
  memory = var.memory

  network_interface {
    network_id = libvirt_network.net1.id
  }
}

resource "libvirt_network" "net1" {
    name      = var.network_name 
    mode      = var.network_mode 
    addresses = [var.network_addresses]
}

resource "libvirt_pool" "test" {
  name = var.pool_name
  type = var.pool_type
  path = var.pool_path

  depends_on = [libvirt_domain.section6]
}