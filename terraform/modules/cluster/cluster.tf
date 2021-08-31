resource "aws_eks_cluster" "PetclinicCluster" {
  name     = "petclinic"
  role_arn = var.ClusterRole_arn

  vpc_config {
    subnet_ids = [aws_subnet.PetclinicNet-2a.id, aws_subnet.PetclinicNet-2b.id]
  }
}
