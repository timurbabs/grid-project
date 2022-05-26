variable "StageTag" {
  default = "Prod"
***REMOVED***
variable "NetCIDR" {
  default = "172.31.80.0/20"
***REMOVED***

module "Infrastructure" {
  source   = "../modules/petclinic-infrastructure"
  StageTag = var.StageTag
  NetCIDR  = var.NetCIDR
***REMOVED***
