output "arn" {
  value       = aws_elasticache_cluster.elasticache_cluster.arn
  description = "The ARN of the created ElastiCache Cluster."
}

output "cache_nodes" {
  value       = aws_elasticache_cluster.elasticache_cluster.cache_nodes
  description = "List of node objects including id, address, port and availability_zone."
}