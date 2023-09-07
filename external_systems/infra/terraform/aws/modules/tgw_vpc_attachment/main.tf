resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  transit_gateway_id     = var.transit_gateway_id
  vpc_id                 = var.vpc_id
  subnet_ids             = var.subnet_ids
  appliance_mode_support = var.vpc_attachment_appliance_mode_support
  dns_support            = var.vpc_attachment_dns_support
  ipv6_support           = var.vpc_attachment_ipv6_support
  tags = merge(var.tags, {
    Name        = "${var.prefix}-${var.environment}-tgw-vpc-attachment"
    Environment = var.environment
  })
}