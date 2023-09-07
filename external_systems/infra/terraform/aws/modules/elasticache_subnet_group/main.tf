/* ElastiCache subnet group */

resource "aws_elasticache_subnet_group" "elasticache_sb_group" {

  name = var.name

  description = var.description
  subnet_ids  = var.subnet_ids

  tags = merge(var.tags, {
    Environment = var.environment
  })
}