output "asg_name" {
  value = aws_eks_node_group.eks_ng.resources[0].autoscaling_groups[0].name
}