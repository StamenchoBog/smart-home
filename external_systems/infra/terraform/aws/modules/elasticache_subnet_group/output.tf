output "subnet_ids" {
  value       = aws_elasticache_subnet_group.elasticache_sb_group.subnet_ids
  description = "The Subnet IDs of the ElastiCache Subnet Group."
}

output "name" {
  value       = aws_elasticache_subnet_group.elasticache_sb_group.name
  description = "The Name of the ElastiCache Subnet Group."
}
