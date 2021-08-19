variable "StageTag" {
  default = "Prod"
}
variable "NetCIDR" {
  default = "172.31.80.0/20"
}

module "Infrastructure" {
  source   = "../modules/petclinic-infrastructure"
  StageTag = var.StageTag
  NetCIDR  = var.NetCIDR
}
