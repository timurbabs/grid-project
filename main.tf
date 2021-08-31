provider "aws" {
  shared_credentials_file = var.CredsFileName
  region                  = var.Region
}

module "DockerRegistry" {
  source = "./terraform/PC-docker"
}

module "DockerSourceRegistry" {
  source = "./terraform/PC-sources"
}

module "ArtifactRegistry" {
  source = "./terraform/PC-artifact"
}

module "DevCluster" {
  source = "./terraform/PC-cluster"
  ClusterRole_arn = var.ClusterRole_arn
  PoolRole_arn = var.PoolRole_arn
  VPC = var.VPC
  CIDR_a = var.CIDR_a
  CIDR_b = var.CIDR_b
  Region = var.Region
  SSHKey = var.SSHKey
}
