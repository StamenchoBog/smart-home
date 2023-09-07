/* CloudFront Origin Access Control */

resource "aws_cloudfront_origin_access_control" "cf_origin_access" {

  name        = var.name
  description = var.description

  origin_access_control_origin_type = var.origin_access_control_origin_type
  signing_behavior                  = var.signing_behavior
  signing_protocol                  = var.signing_protocol
}
