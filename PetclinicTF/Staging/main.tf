variable "StageTag" {
  default = "Stag"
***REMOVED***
variable "NetCIDR" {
  default = "172.31.64.0/20"
***REMOVED***

module "Infrastructure" {
  source   = "../modules/petclinic-infrastructure"
  StageTag = var.StageTag
  NetCIDR  = var.NetCIDR
***REMOVED***
