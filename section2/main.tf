terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.2"
    }
  }
 required_version = ">= 0.13"
}

provider "libvirt" {
    uri = "qemu:///system"
}

resource "libvirt_volume" "ubuntu-qcow2" {
  name   = "ubuntu-qcow2"
  pool   = "default"
  source = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
  format = "qcow2"
}

data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}

data "template_file" "network_config" {
  template = file("${path.module}/network_config.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = "default"
}

resource "libvirt_domain" "domain-ubuntu" {
  name   = "terraform_demo"
  memory = "512"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_name = "default"
    wait_for_lease = true
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.ubuntu-qcow2.id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}

output "ips" {
  value = libvirt_domain.domain-ubuntu.*.network_interface.0.addresses
}