data "terraform_remote_state" "machineA" {
    backend = "local"
    config = {
        path = "${path.module}/../backend/terraform.tfstate"
    }
}