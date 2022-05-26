provider "aws" {
  shared_credentials_file = "./creds.csv"
  region                  = var.region
***REMOVED***

module "Development" {
  source = "./PetclinicTF/Development"
***REMOVED***

# module "Staging" {
#   source = "./PetclinicTF/Staging"
# ***REMOVED***

# module "Production" {
#   source = "./PetclinicTF/Development"
# ***REMOVED***
