resource "aws_eks_fargate_profile" "profile1" {
  cluster_name           = aws_eks_cluster.main.name
  fargate_profile_name   = "fp-jenkins"
  pod_execution_role_arn = aws_iam_role.fargate_pod_execution_role.arn
  subnet_ids             = var.private_subnets

  selector {
    namespace = "jenkins"
  }

  selector {
    namespace = "test"
  }
}

resource "aws_eks_fargate_profile" "profile2" {
  cluster_name           = aws_eks_cluster.main.name
  fargate_profile_name   = "fp-monitoring"
  pod_execution_role_arn = aws_iam_role.fargate_pod_execution_role.arn
  subnet_ids             = var.private_subnets

  selector {
    namespace = "monitoring"
  }

  selector {
    namespace = "test-2"
  }
}