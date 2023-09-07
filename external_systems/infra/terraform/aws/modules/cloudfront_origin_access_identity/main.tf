/* CloudFront origin access identity */

resource "aws_cloudfront_origin_access_identity" "cf_origin_access_identity" {
  comment = var.comment
}
