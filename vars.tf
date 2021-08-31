variable "Region" {
  default = "us-east-2"
}

variable "CredsFileName" {
  default = "./creds.csv"
}

variable "ClusterRole_arn" {
  default = "arn:aws:iam::193719876407:role/EKS"
}

variable "PoolRole_arn" {
  default = "arn:aws:iam::193719876407:role/EKS-nodes"
}

variable "VPC" {
  default = "vpc-d1b531b8"
}

variable "CIDR_a" {
  default = "172.31.48.0/20"
}

variable "CIDR_b" {
  default = "172.31.64.0/20"
}

variable "SSHKey" {
  default = "tbaburin-test-linux-ohio"
}
