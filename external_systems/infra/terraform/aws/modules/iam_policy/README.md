# IAM Policy module

The IAM policy module creates IAM policy from the given variables.

## Module logic and accepted variables

The module accepts couple of variables and provides an IAM policy resource, which provides an IAM policy.

### Resources

| Name | Type |
|------|------|
| [aws_iam_policy.iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | n/a | `string` | `null` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN assigned by AWS to this policy. |
| <a name="output_id"></a> [id](#output\_id) | The ID assigned by AWS to this policy. |

## Usage

Example usage for `main.tf` file:

```terraform
module "iam_policy" {
  source = "../../modules/iam_policy"
  name = "custom-policy"
  path = "/"
  policy = module.iam_policy_document.json
}
```
