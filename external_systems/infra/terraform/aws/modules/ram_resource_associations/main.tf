resource "aws_ram_resource_association" "ram_ra" {

  resource_arn       = var.resource_arn
  resource_share_arn = var.resource_share_arn
}