resource "libvirt_network" "networkA" {
    name      = "${var.environment}_network"
    mode      = "nat"
    addresses = ["10.17.3.0/24"]
}