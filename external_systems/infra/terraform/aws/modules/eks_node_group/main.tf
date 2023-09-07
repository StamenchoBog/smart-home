resource "aws_eks_node_group" "eks_ng" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  capacity_type  = var.capacity_type
  instance_types = var.instance_types

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = 1
  }

  remote_access {
    ec2_ssh_key               = var.ec2_ssh_key
    source_security_group_ids = var.security_group
  }

  tags = merge(var.tags, {
    Environment = var.environment
  })

}

resource "aws_autoscaling_policy" "eks_autoscaling_policy" {

  name                   = "${aws_eks_node_group.eks_ng.resources[0].autoscaling_groups[0].name}-autoscaling-policy"
  autoscaling_group_name = aws_eks_node_group.eks_ng.resources[0].autoscaling_groups[0].name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.autoscaling_average_cpu
  }
}
