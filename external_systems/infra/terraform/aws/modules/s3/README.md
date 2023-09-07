# S3 module

The S3 module creates a S3 bucket from the given variables.

## Module logic and accepted variables

The module accepts range of variables with them defining the configuration for an S3 bucket and creates a bucket depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `bucket_name = my-new-bucket`. The type of the variable is `string`.
- `bucket_block_public_acls = true`. The type of the variable is `bool`.
- `bucket_block_public_policy = true`. The type of the variable is `bool`.
- `bucket_ignore_public_acls = true`. The type of the variable is `bool`.
- `bucket_restrict_public_buckets = true`. The type of the variable is `bool`.
- `bucket_versioning = "Enabled"`. The type of the variable is `string`.
- `bucket_logging = { enabled = false }`. The type of the variable is `object({...})`.
- `bucket_encryption = { enabled = true configuration = { deletion_window_in_days = 10 enable_key_rotation = true } }`. The type of the variable is `object({...})`.

### Main file example

Example for `main.tf` file:

```terraform
module "s3" {
  source      = "../../modules/s3"
  bucket_name = var.bucket_name

  bucket_block_public_acls       = var.all_vars.bucket_block_public_acls
  bucket_block_public_policy     = var.all_vars.bucket_block_public_policy
  bucket_ignore_public_acls      = var.all_vars.bucket_ignore_public_acls
  bucket_restrict_public_buckets = var.all_vars.bucket_restrict_public_buckets

  bucket_versioning = var.all_vars.bucket_versioning

  bucket_logging = var.all_vars.bucket_logging

  bucket_encryption = var.all_vars.bucket_encryption
}
```

## Outputs

The module outputs `s3_bucket_id` for future usage.
