# KMS key module

The module `kms_key` creates and manages a single-Region or multi-Region primary KMS key.

## Module logic and accepted variables

The module accepts couple of variables and creates `KMS key` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

### Resources

| Name | Type |
|------|------|
| [aws_kms_alias.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias"></a> [alias](#input\_alias) | The display name of the alias. The name must start with the word 'alias' followed by a forward slash (alias/) | `string` | n/a | yes |
| <a name="input_bypass_policy_lockout_safety_check"></a> [bypass\_policy\_lockout\_safety\_check](#input\_bypass\_policy\_lockout\_safety\_check) | n/a | `bool` | `null` | no |
| <a name="input_custom_key_store_id"></a> [custom\_key\_store\_id](#input\_custom\_key\_store\_id) | n/a | `string` | `null` | no |
| <a name="input_customer_master_key_spec"></a> [customer\_master\_key\_spec](#input\_customer\_master\_key\_spec) | n/a | `string` | `null` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | n/a | `number` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `null` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | n/a | `bool` | `null` | no |
| <a name="input_key_usage"></a> [key\_usage](#input\_key\_usage) | n/a | `string` | `null` | no |
| <a name="input_multi_region"></a> [multi\_region](#input\_multi\_region) | n/a | `bool` | `null` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | n/a | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the key. |
| <a name="output_id"></a> [id](#output\_id) | The globally unique identifier for the key. |

### Usage

Example for `main.tf` file:

```terraform
module "kms_key" {
  source = "../../modules/kms_key"

  alias                   = var.test_vars.kms_key.alias
  description             = var.test_vars.kms_key.key_usage
  key_usage               = var.test_vars.kms_key.key_usage
  deletion_window_in_days = var.test_vars.kms_key.deletion_window_in_days
  enable_key_rotation     = var.test_vars.kms_key.enable_key_rotation
  multi_region            = var.test_vars.kms_key.multi_region
  tags                    = merge(var.all_vars.default_tags, var.test_vars.tags, var.test_vars.kms_key.tags)
}
```
