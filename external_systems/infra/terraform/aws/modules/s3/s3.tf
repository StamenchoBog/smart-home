
/* ======== S3 bucket ========= */
resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name

  tags = merge(var.tags, {
    Environment = var.environment
  })
}

resource "aws_s3_bucket_public_access_block" "s3_public_access_block" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = var.bucket_block_public_acls
  block_public_policy     = var.bucket_block_public_policy
  ignore_public_acls      = var.bucket_ignore_public_acls
  restrict_public_buckets = var.bucket_restrict_public_buckets
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.s3.id
  versioning_configuration {
    status = var.bucket_versioning
  }
}

/* ====== Server-side encryption for S3 bucket ======== */

resource "aws_kms_key" "s3_encryption_key" {
  count = var.bucket_encryption.enabled == true ? 1 : 0

  description             = "This key is used to encrypt bucket objects in bucket - ${var.bucket_name}"
  deletion_window_in_days = var.bucket_encryption.configuration["deletion_window_in_days"]
  enable_key_rotation     = var.bucket_encryption.configuration["enable_key_rotation"]
}

resource "aws_kms_alias" "s3_encryption_key_alias" {
  count = var.bucket_encryption.key_alias != null ? 1 : 0

  name          = var.bucket_encryption.key_alias
  target_key_id = aws_kms_key.s3_encryption_key[0].id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  count = var.bucket_encryption.enabled == true ? 1 : 0

  bucket = aws_s3_bucket.s3.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption_key[0].id
      sse_algorithm     = "aws:kms"
    }
  }
}

/* ======== S3 bucket for storing access logs ========== */

resource "aws_s3_bucket_logging" "logging" {
  count = var.bucket_logging.enabled == true ? 1 : 0

  bucket        = aws_s3_bucket.s3.id
  target_bucket = aws_s3_bucket.access_log_bucket[0].id
  target_prefix = var.bucket_logging.configuration["target_prefix"]
}


resource "aws_s3_bucket" "access_log_bucket" {
  count = var.bucket_logging.enabled == true ? 1 : 0

  bucket = "${var.bucket_name}-logs"
  tags = merge(var.tags, {
    Environment = var.environment
  })
}

# Log buckets do not need versioning because objects are written only once
resource "aws_s3_bucket_versioning" "access_log_bucket_versioning" {
  count = var.bucket_logging.enabled == true ? 1 : 0

  bucket = aws_s3_bucket.access_log_bucket[0].id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  count = var.bucket_logging.enabled == true ? 1 : 0

  bucket = aws_s3_bucket.access_log_bucket[0].id
  acl    = "log-delivery-write"

  depends_on = [
    aws_s3_bucket.access_log_bucket
  ]
}

resource "aws_s3_bucket_public_access_block" "log_bucket_public_access_block" {
  count = var.bucket_logging.enabled == true ? 1 : 0

  bucket = aws_s3_bucket.access_log_bucket[0].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

/* ========= Server-side encryption for access logs bucket ========== */
resource "aws_kms_key" "s3_logs_encryption_key" {
  count = var.bucket_logging.enabled == true ? 1 : 0

  description             = "This key is used to encrypt bucket objects in bucket - ${aws_s3_bucket.access_log_bucket[0].bucket}"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_logs_encryption" {
  count = var.bucket_logging.enabled == true ? 1 : 0

  bucket = aws_s3_bucket.access_log_bucket[0].id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_logs_encryption_key[0].id
      sse_algorithm     = "aws:kms"
    }
  }
}
