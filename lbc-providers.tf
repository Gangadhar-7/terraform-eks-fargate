# Terraform Kubernetes Provider
data "aws_eks_cluster_auth" "cluster" {
  name = aws_eks_cluster.main.name
}


# #External data source to get EKS token
# data "external" "eks_token" {
#   program = ["sh", "${path.module}/get_eks_token.sh", data.aws_eks_cluster_auth.cluster.name, var.region]
# }

# locals {
#   eks_token = jsondecode(data.external.eks_token.result).token
# }



provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.main.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

# HELM Provider
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.main.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token 
  }
}

# output "eks_token" {
#   value = data.aws_eks_cluster_auth.cluster.token
# }
