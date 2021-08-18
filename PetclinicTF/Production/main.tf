variable "StageTag" {
    default = "Dev"
}
variable "NetCIDR" {
    default = "172.31.80.0/20"
}

module "Infrustructure" {
  source = "../modules/petclinic-infrustructure"
  StageTag = var.StageTag
  NetCIDR = var.NetCIDR
}
