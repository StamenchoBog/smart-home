# In order to dismiss the warning showing up: `Reference to undefined provider`
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_acm_certificate" "certificate" {
  domain_name               = var.domain_name
  validation_method         = var.validation_method
  subject_alternative_names = var.subject_alternative_names

  tags = {
    Name        = "${var.prefix}-${var.environment}-${var.domain_name}"
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}
