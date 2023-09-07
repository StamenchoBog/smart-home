resource "aws_route53_zone" "hosted_zone" {
  name = var.name

  tags = merge(var.tags, {
    Environment = var.environment
  })
}
