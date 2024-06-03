
# provider "local" {
#   version = "~> 1.4"
# }

# provider "template" {
#   version = "~> 2.1"
# }
# provider "external" {
#   version = "~> 1.2"
# }

# Terraform HTTP Provider Block

data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.main.id
}
