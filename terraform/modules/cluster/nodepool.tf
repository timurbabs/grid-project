resource "aws_eks_node_group" "NodePool" {
  cluster_name    = aws_eks_cluster.PetclinicCluster.name
  node_group_name = "default-cluster"
  node_role_arn   = var.PoolRole_arn
  subnet_ids      = [aws_subnet.PetclinicNet-2b.id, aws_subnet.PetclinicNet-2a.id]

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }

  update_config {
    max_unavailable = 2
  }

  remote_access {
      ec2_ssh_key = var.SSHKey
      source_security_group_ids = [aws_security_group.NodesSecurityGroup.id]
  }
}
