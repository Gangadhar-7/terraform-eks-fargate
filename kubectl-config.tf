# data "template_file" "kubeconfig" {
#   template = file("${path.module}/templates/kubeconfig.tpl")

#   vars = {
#     kubeconfig_name     = aws_eks_cluster.main.name
#     clustername         = aws_eks_cluster.main.name
#     endpoint            = data.aws_eks_cluster.cluster.endpoint
#     cluster_auth_base64 = data.aws_eks_cluster.cluster.certificate_authority[0].data
#   }
# }

# resource "local_file" "kubeconfig" {
#   content  = data.template_file.kubeconfig.rendered
#   filename = pathexpand("~/.kube/config")
# }