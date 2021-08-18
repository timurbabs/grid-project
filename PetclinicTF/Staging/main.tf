variable "StageTag" {
  default = "Stag"
***REMOVED***
variable "NetCIDR" {
  default = "172.31.48.0/20"
***REMOVED***

module "Infrustructure" {
  source   = "../modules/petclinic-infrustructure"
  StageTag = var.StageTag
  NetCIDR  = var.NetCIDR
***REMOVED***
