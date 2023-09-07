# Launch template module

The module `ssm_parameter` provides an SSM Parameter resource.

## Module logic and accepted variables

The module accepts couple of variables and creates `SSM parameter` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

### Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.ssm_parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_pattern"></a> [allowed\_pattern](#input\_allowed\_pattern) | n/a | `string` | `null` | no |
| <a name="input_data_type"></a> [data\_type](#input\_data\_type) | n/a | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_insecure_value"></a> [insecure\_value](#input\_insecure\_value) | n/a | `string` | `null` | no |
| <a name="input_key_id"></a> [key\_id](#input\_key\_id) | n/a | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `null` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | n/a | `string` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | n/a | `string` | n/a | yes |
| <a name="input_value"></a> [value](#input\_value) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the parameter |
| <a name="output_version"></a> [version](#output\_version) | Version of the parameter |

### Usage

Example for `main.tf` file:

```terraform
module "ssm_ldap_certificate" {
  source = "../../modules/ssm_parameter"

  name = "<org>-production-app"
  type = "SecureString"

  tags = merge(var.all_vars.default_tags, var.app_vars.tags)
}
```
