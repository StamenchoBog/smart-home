output "id" {
  value = aws_s3_bucket.s3.id
}

output "arn" {
  value = aws_s3_bucket.s3.arn
}

output "kms_key_arn" {
  value = aws_kms_key.s3_encryption_key[0].arn
}

output "kms_key_id" {
  value = aws_kms_key.s3_encryption_key[0].id
}

output "bucket" {
  value = aws_s3_bucket.s3.bucket
}
