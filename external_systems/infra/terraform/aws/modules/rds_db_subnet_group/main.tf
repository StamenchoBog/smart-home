resource "aws_db_subnet_group" "db_subnet_group" {
  name        = var.name
  description = var.description
  subnet_ids  = var.subnet_ids
  tags = merge(var.tags, {
    Environment = var.environment
  })
}
