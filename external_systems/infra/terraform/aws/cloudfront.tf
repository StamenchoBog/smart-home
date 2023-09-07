locals {
  # Home Assistant origin
  homeassistant_origin_id = "smarthome_application_instance"
}

/* Application instance public DNS name */
data "aws_instance" "application_instance" {
  instance_tags = var.homeassistant_vars.instance.tags
  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
  depends_on = [module.homeassistant_asg]
}

module "cf_distribution" {
  source      = "./modules/cloudfront_distribution"
  environment = var.all_vars.environment

  enabled = var.cloudfront_vars.enabled
  comment = var.cloudfront_vars.comment
  aliases = [var.all_vars.base_domain]

  origins = [
    # Application EC2 instance
    {
      origin_id            = local.homeassistant_origin_id
      domain_name          = data.aws_instance.application_instance.public_dns
      custom_origin_config = var.cloudfront_vars.custom_origin_config
    }
  ]

  default_cache_behavior = {
    allowed_methods          = var.cloudfront_vars.default_cache_behavior.allowed_methods
    cached_methods           = var.cloudfront_vars.default_cache_behavior.cached_methods
    cache_policy_id          = var.cloudfront_vars.default_cache_behavior.cache_policy_id
    origin_request_policy_id = var.cloudfront_vars.default_cache_behavior.origin_request_policy_id
    target_origin_id         = local.homeassistant_origin_id
    min_ttl                  = var.cloudfront_vars.default_cache_behavior.min_ttl
    default_ttl              = var.cloudfront_vars.default_cache_behavior.default_ttl
    max_ttl                  = var.cloudfront_vars.default_cache_behavior.max_ttl
    viewer_protocol_policy   = var.cloudfront_vars.default_cache_behavior.viewer_protocol_policy
    compress                 = var.cloudfront_vars.default_cache_behavior.compress
  }

  viewer_certificate = {
    acm_certificate_arn      = aws_acm_certificate.cdn_certificate.arn
    ssl_support_method       = var.cloudfront_vars.viewer_certificate.ssl_support_method
    minimum_protocol_version = var.cloudfront_vars.viewer_certificate.minimum_protocol_version
  }

  restrictions = var.cloudfront_vars.restrictions

  tags = merge(var.tags, var.cloudfront_vars.tags)
}
