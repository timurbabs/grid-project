provider "aws" {
  shared_credentials_file = "./creds.csv"
  region                  = var.region
}

module "Development" {
  source = "./PetclinicTF/Development"
}

# module "Staging" {
#   source = "./PetclinicTF/Staging"
# }

# module "Production" {
#   source = "./PetclinicTF/Development"
# }
