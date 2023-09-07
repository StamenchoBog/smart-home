# CloudFront Origin Access Identity module

The module `aws_cloudfront_origin_access_identity` provides an CloudFront origin access identity resource.

## Module logic and accepted variables

The module accepts couple of variables and creates `aws_cloudfront_origin_access_identity` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

### Resources

| Name | Type |
|------|------|
| [aws_cloudfront_origin_access_identity.cf_origin_access_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

|------|-------------|------|---------|:--------:|
| <a name="input_comment"></a> [comment](#input\_comment) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_etag"></a> [etag](#output\_etag) | The current version of the origin access identity's information. For example: E2QWRUHAPOMQZL. |
| <a name="output_iam_arn"></a> [iam\_arn](#output\_iam\_arn) | A pre-generated ARN for use in S3 bucket policies (see below). Example: arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E2QWRUHAPOMQZL. |
| <a name="output_id"></a> [id](#output\_id) | The identifier for the distribution. For example: EDFDVBD632BHDS5. |

## Usage

Example for `main.tf` file:

```terraform
module "cf_origin_access_identity" {
    source = "../../modules/cloudfront_origin_access_identity"

    comment = "Some comment"
}
```
