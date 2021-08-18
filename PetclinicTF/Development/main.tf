variable "StageTag" {
  default = "Dev"
***REMOVED***
variable "NetCIDR" {
  default = "172.31.64.0/20"
***REMOVED***

module "Infrustructure" {
  source   = "../modules/petclinic-infrustructure"
  StageTag = var.StageTag
  NetCIDR  = var.NetCIDR
***REMOVED***
