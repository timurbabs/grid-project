variable "RegistryName" {
  default = "petclinic-docker-source-registry"
}

module "Registry" {
  source       = "../modules/docker-registry"
  RegistryName = var.RegistryName
}
