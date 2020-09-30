resource "libvirt_domain" "section7B" {
  name   = "${data.terraform_remote_state.machineA.outputs.machine_name}_clone"
  vcpu   = var.vcpu
  memory = var.memory
}