resource "acme_registration" "registration" {
  account_key_pem = module.key_pair.private_key_pem
  email_address   = "" # Populate with you email address
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.registration.account_key_pem
  common_name               = var.all_vars.base_domain
  subject_alternative_names = ["*.${var.all_vars.base_domain}"]

  dns_challenge {
    provider = "route53"
    config = {
      AWS_HOSTED_ZONE_ID = module.route53_zone.hosted_zone_id
    }
  }

  depends_on = [acme_registration.registration]
}

# Store them as a ACM in Virginia in order to be used by CloudFront
resource "aws_acm_certificate" "cdn_certificate" {
  certificate_body  = acme_certificate.certificate.certificate_pem
  private_key       = acme_certificate.certificate.private_key_pem
  certificate_chain = "${acme_certificate.certificate.certificate_pem}${acme_certificate.certificate.issuer_pem}"

  provider = aws.virginia
}

# Store them in a folder certificates S3 bucket to be used by Nginx
resource "aws_s3_object" "certificate_artifacts" {
  for_each = toset(["certificate_pem", "issuer_pem", "private_key_pem"])

  bucket  = module.cert_and_config_bucket.bucket
  key     = "certificates/${each.key}"
  content = lookup(acme_certificate.certificate, "${each.key}")
}

# Store the full chain certificate
resource "aws_s3_object" "full_chain_certificate_artifact" {
  bucket  = module.cert_and_config_bucket.bucket
  key     = "certificates/fullchain_pem"
  content = "${acme_certificate.certificate.certificate_pem}${acme_certificate.certificate.issuer_pem}"
}
