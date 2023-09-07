/* Security group rule */

resource "aws_security_group_rule" "sg_rule" {
  security_group_id = var.security_group_id

  description = var.description
  type        = var.type
  from_port   = var.from_port
  to_port     = var.to_port
  protocol    = var.protocol

  source_security_group_id = var.source_security_group_id

  #tfsec:ignore:aws-ec2-no-public-ingress-sgr
  cidr_blocks      = var.cidr_blocks
  ipv6_cidr_blocks = var.ipv6_cidr_blocks
}
