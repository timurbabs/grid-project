variable "StageTag" {
  default = "Dev"
***REMOVED***
variable "NetCIDR" {
  default = "172.31.48.0/20"
***REMOVED***

module "Infrastructure" {
  source   = "../modules/petclinic-infrastructure"
  StageTag = var.StageTag
  NetCIDR  = var.NetCIDR
***REMOVED***
