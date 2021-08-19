variable "StageTag" {
  default = "Dev"
}
variable "NetCIDR" {
  default = "172.31.48.0/20"
}

module "Infrastructure" {
  source   = "../modules/petclinic-infrastructure"
  StageTag = var.StageTag
  NetCIDR  = var.NetCIDR
}
