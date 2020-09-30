variable "name" {
    default = "worker"
}

variable "vcpu" {
    default = "1"
 }

variable "memory" {
    default = "512"
}

variable "environment" {
    default = "development"
}

variable "controller_network_id" {}