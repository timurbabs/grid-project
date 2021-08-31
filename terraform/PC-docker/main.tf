variable "RegistryName" {
  default = "petclinic-docker-registry"
}

module "Registry" {
    source = "../modules/docker-registry"
    RegistryName = var.RegistryName
}
