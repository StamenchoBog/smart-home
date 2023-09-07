resource "aws_eks_cluster" "eks_cluster" {
  name                      = var.cluster_name
  version                   = var.eks_version
  role_arn                  = var.role_arn
  enabled_cluster_log_types = var.enabled_cluster_log_types

  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_private_access = var.cluster_endpoint_private_access

    endpoint_public_access = var.cluster_endpoint_public_access
    public_access_cidrs    = var.public_access_cidrs
  }
  kubernetes_network_config {
    ip_family         = var.cluster_ip_family
    service_ipv4_cidr = var.cluster_service_ipv4_cidr
  }

  tags = merge(var.eks_cluster_tags, {
    Environment = var.environment
  })
}

resource "aws_cloudwatch_log_group" "eks_logs" {

  name              = "/aws/eks/${var.cluster_name}/cluster-logs"
  retention_in_days = 7

  tags = merge(var.cloudwatch_log_group_tags, {
    Environment = var.environment
  })
}