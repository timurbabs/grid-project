provider "aws" {
  shared_credentials_file = "./creds.csv"
  region     = var.region
***REMOVED***
module "Petclinic" {
  source = "./PetclinicTF"
***REMOVED***
