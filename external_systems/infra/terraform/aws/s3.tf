/* Bucket holding all the configurations and certificates */
module "cert_and_config_bucket" {
  source = "./modules/s3"

  environment                    = var.all_vars.environment
  bucket_name                    = var.s3_bucket_vars.name
  bucket_block_public_acls       = var.s3_bucket_vars.block_public_acls
  bucket_block_public_policy     = var.s3_bucket_vars.block_public_policy
  bucket_ignore_public_acls      = var.s3_bucket_vars.ignore_public_acls
  bucket_restrict_public_buckets = var.s3_bucket_vars.ignore_public_acls
  bucket_encryption              = var.s3_bucket_vars.encryption
  bucket_logging                 = var.s3_bucket_vars.logging
  bucket_versioning              = var.s3_bucket_vars.versioning
  tags                           = merge(var.tags, var.s3_bucket_vars.tags)
}

/* Upload entire folder to S3 bucket */
resource "aws_s3_object" "config_files" {
  for_each = fileset("${path.module}/files", "**")

  bucket = module.cert_and_config_bucket.bucket
  key    = each.value
  source = "${path.module}/files/${each.value}"
}
