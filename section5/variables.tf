variable "qemu_uri" {
    type = string
    default = "qemu:///system"
}

variable "name" {
    type = string
    default = "lab"
}

variable "vcpu" { }

variable "memory" {
    type = number
    default = "512"
}

variable "network_name" {
    type = string
    default = "networktest"
}

variable "network_mode" {
    type = string
    default = "nat"
}

variable "network_addresses" {
    type = string
    default = "10.17.3.0/24"
}

variable "pool_name" {
    type = string
    default = "test_pool"
}

variable "pool_type" {
    type = string
    default = "dir"
}

variable "pool_path" {
    type = string
    default = "/tmp/terraform-pool"
}