/* Auto-scaling placement group */

resource "aws_placement_group" "asg_pg" {
  name = var.name

  strategy        = var.strategy
  partition_count = var.partition_count
  spread_level    = var.spread_level

  tags = merge(var.tags, {
    Environment = var.environment
  })
}
