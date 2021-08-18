variable "StageTag" {
  default = "Stag"
}
variable "NetCIDR" {
  default = "172.31.48.0/20"
}

module "Infrustructure" {
  source   = "../modules/petclinic-infrustructure"
  StageTag = var.StageTag
  NetCIDR  = var.NetCIDR
}
