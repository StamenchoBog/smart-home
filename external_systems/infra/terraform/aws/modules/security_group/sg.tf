/*==== The Security Group ======*/

resource "aws_security_group" "sg" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  /* Ingress rules */
  dynamic "ingress" {
    for_each = var.ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      #tfsec:ignore:aws-ec2-no-public-ingress-sgr
      cidr_blocks     = ingress.value.cidr
      security_groups = ingress.value.security_groups
    }
  }
  /* Egress rules */
  dynamic "egress" {
    for_each = var.egress_rules

    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      #tfsec:ignore:aws-ec2-no-public-egress-sgr
      cidr_blocks     = egress.value.cidr
      security_groups = egress.value.security_groups
    }
  }
  /* Lifecycle policy */
  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}
