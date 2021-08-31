variable "RegistryName" {
  default = "petclinic-docker-registry"
}

module "Registry" {
  source       = "../modules/artifact-registry"
  RegistryName = var.RegistryName
}
