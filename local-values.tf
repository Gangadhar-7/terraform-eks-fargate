# Define Local Values in Terraform
locals {
  name             = "mumbai-eks"
  eks_cluster_name = aws_eks_cluster.main.name
}