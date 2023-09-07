/*==== Transit gateway ======*/

resource "aws_ec2_transit_gateway" "tgw" {
  description                    = "Main transit gateway"
  auto_accept_shared_attachments = var.auto_accept_shared_attachments
  # default_route_table_association = var.default_route_table_association
  # default_route_table_propagation = var.default_route_table_propagation
  # dns_support                     = var.dns_support
  # vpn_ecmp_support                = var.vpn_ecmp_support
  # transit_gateway_cidr_blocks     = var.transit_gateway_cidr_blocks
  tags = merge(var.tags, {
    Name = "${var.prefix}-${var.environment}-tgw"
  })
}