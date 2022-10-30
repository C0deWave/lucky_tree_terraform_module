
output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "get_kubeconfig" {
  value = "aws eks --region ap-northeast-2  update-kubeconfig --name st_lucky_tree_cluster"
}