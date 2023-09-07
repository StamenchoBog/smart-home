# CloudFront Origin Access Control module

The module `aws_cloudfront_origin_access_control` provides an CloudFront origin access control resource.

## Module logic and accepted variables

The module accepts couple of variables and creates `aws_cloudfront_origin_access_control` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

### Resources

| Name | Type |
|------|------|
| [aws_cloudfront_origin_access_control.cf_origin_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_origin_access_control_origin_type"></a> [origin\_access\_control\_origin\_type](#input\_origin\_access\_control\_origin\_type) | n/a | `string` | n/a | yes |
| <a name="input_signing_behavior"></a> [signing\_behavior](#input\_signing\_behavior) | n/a | `string` | n/a | yes |
| <a name="input_signing_protocol"></a> [signing\_protocol](#input\_signing\_protocol) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of this Origin Access Control. |

## Usage

Example for `main.tf` file:

```terraform
module "cf_origin_access_control" {
  source = "../../modules/cloudfront_origin_access_control"
  
  name                              = "example"
  description                       = "Example Policy"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
```
