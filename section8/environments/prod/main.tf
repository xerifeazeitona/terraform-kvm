module "controller" {
    source = "../../modules/moduleA"
    environment = var.environment
    name = "${var.name}_controller"
    vcpu = var.vcpu_controller
    memory = var.memory_controller
}

module "worker1" {
    source = "../../modules/moduleB"
    environment = var.environment
    name = "${var.name}_worker1"
    vcpu = var.vcpu_worker
    memory = var.memory_worker
    controller_network_id = module.controller.network_id
}

module "worker2" {
    source = "../../modules/moduleB"
    environment = var.environment
    name = "${var.name}_worker2"
    vcpu = var.vcpu_worker
    memory = var.memory_worker
    controller_network_id = module.controller.network_id
}