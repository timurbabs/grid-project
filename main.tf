provider "google" {
  project = "petclinic-323209"
  credentials = file("key.json")
  region     = var.region
}

module "Petclinic" {
  source = "./PetclinicTF"
}
