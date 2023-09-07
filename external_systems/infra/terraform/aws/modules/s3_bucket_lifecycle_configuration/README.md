# S3 bucket lifecycle configuration module

TheS3 bucket lifecycle configuration module provides an independent configuration resource for S3 bucket lifecycle configuration from the given variables.

## Module logic and accepted variables

The module accepts couple of variables and provides an independent configuration resource for S3 bucket lifecycle configuration depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards.

### Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_lifecycle_configuration.lifecycle](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |


### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | n/a | `string` | n/a | yes |
| <a name="input_expected_bucket_owner"></a> [expected\_bucket\_owner](#input\_expected\_bucket\_owner) | n/a | `string` | `null` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | n/a | <pre>list(object({<br>    id     = string<br>    status = string<br>    abort_incomplete_multipart_upload = optional(object({<br>      days_after_initiation = number<br>    }))<br>    expiration = optional(object({<br>      date                         = optional(string)<br>      days                         = optional(number)<br>      expired_object_delete_marker = optional(bool)<br>    }))<br>    filter = optional(object({<br>      and = optional(object({<br>        object_size_greater_than = optional(number)<br>        object_size_less_than    = optional(number)<br>        prefix                   = optional(string)<br>        tags                     = optional(map(string))<br>      }))<br>      object_size_greater_than = optional(number)<br>      object_size_less_than    = optional(number)<br>      prefix                   = optional(string)<br>      tag = optional(object({<br>        key   = string<br>        value = string<br>      }))<br>    }))<br>    noncurrent_version_expiration = optional(object({<br>      newer_noncurrent_versions = optional(number)<br>      noncurrent_days           = optional(number)<br>    }))<br>    noncurrent_version_transition = optional(object({<br>      newer_noncurrent_versions = optional(number)<br>      noncurrent_days           = optional(number)<br>      storage_class             = string<br>    }))<br>    transitions = optional(list(object({<br>      date          = optional(string)<br>      days          = optional(number)<br>      storage_class = string<br>    })))<br>  }))</pre> | n/a | yes |


## Outputs

No outputs.

## Usage

Example usage for `main.tf` file:

```terraform
#TODO:
```
