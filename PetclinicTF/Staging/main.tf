variable "StageTag" {
  default = "Stag"
}
variable "NetCIDR" {
  default = "172.31.64.0/20"
}

module "Infrastructure" {
  source   = "../modules/petclinic-infrastructure"
  StageTag = var.StageTag
  NetCIDR  = var.NetCIDR
}
