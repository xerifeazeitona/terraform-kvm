variable "name" {
    type = string
    default = "lab"
}

variable "vcpu" { 
    type = number
}

variable "memory" {
    type = number
    default = "512"
}

variable "qemu_uri" {
    type = string
    default = "qemu:///system"
}