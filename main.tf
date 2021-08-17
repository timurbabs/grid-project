provider "aws" {
  shared_credentials_file = "./creds.csv"
  region     = var.region
}
module "Petclinic" {
  source = "./PetclinicTF"
}
