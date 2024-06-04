# Define Local Values in Terraform
locals {
  eks_cluster_name = aws_eks_cluster.main.name
}