resource "libvirt_domain" "section3" {
  name   = "lab"
  vcpu   = 1
  memory = "512"
}