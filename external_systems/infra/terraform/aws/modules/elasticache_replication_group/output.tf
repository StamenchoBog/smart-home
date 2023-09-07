output "id" {
  value       = aws_elasticache_replication_group.elasticache_replication_group.id
  description = "ID of the ElastiCache Replication Group."
}

output "arn" {
  value       = aws_elasticache_replication_group.elasticache_replication_group.arn
  description = "ARN of the created ElastiCache Replication Group."
}

output "name" {
  value       = aws_elasticache_replication_group.elasticache_replication_group.id
  description = "ID of the ElastiCache Replication Group."
}

output "configuration_endpoint_address" {
  value       = aws_elasticache_replication_group.elasticache_replication_group.configuration_endpoint_address
  description = "Address of the replication group configuration endpoint when cluster mode is enabled."
}

output "primary_endpoint_address" {
  value       = aws_elasticache_replication_group.elasticache_replication_group.primary_endpoint_address
  description = "(Redis only) Address of the endpoint for the primary node in the replication group, if the cluster mode is disabled."
}

output "reader_endpoint_address" {
  value       = aws_elasticache_replication_group.elasticache_replication_group.reader_endpoint_address
  description = "(Redis only) Address of the endpoint for the reader node in the replication group, if the cluster mode is disabled."
}
