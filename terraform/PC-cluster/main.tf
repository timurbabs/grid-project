#INPUT VARIABLES

variable "ClusterRole_arn" {
}

variable "PoolRole_arn" {
}

variable "VPC" {
}

variable "Region" {
}

variable "SSHKey" {
}

variable "CIDR_a" {
}

variable "CIDR_b" {
}

module "Cluster" {
  source          = "../modules/cluster"
  ClusterRole_arn = var.ClusterRole_arn
  PoolRole_arn    = var.PoolRole_arn
  CIDR_a          = var.CIDR_a
  CIDR_b          = var.CIDR_b
  VPC             = var.VPC
  Region          = var.Region
  SSHKey          = var.SSHKey
}
