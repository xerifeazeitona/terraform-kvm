variable "name" {
    default = "mycluster"
}

variable "vcpu_controller" {
    default = "1"
 }

variable "memory_controller" {
    default = "1024"
}

variable "environment" {
    default = "dev"
}

variable "qemu_uri" {
    default = "qemu:///system"
}

variable "vcpu_worker" {
    default = "1"
 }

variable "memory_worker" {
    default = "1024"
}