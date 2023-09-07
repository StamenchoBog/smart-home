# KMS key grant module

The module `kms_grant` grants usage of a KMS key to certain IAM role.

## Module logic and accepted variables

The module accepts couple of variables and allows usage of a KMS key depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

### Resources

| Name | Type |
|------|------|
| [aws_kms_grant.a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_grant) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_constraints"></a> [constraints](#input\_constraints) | n/a | <pre>object({<br>    encryption_context_equals = optional(map(string))<br>    encryption_context_subset = optional(map(string))<br>  })</pre> | `null` | no |
| <a name="input_grant_creation_tokens"></a> [grant\_creation\_tokens](#input\_grant\_creation\_tokens) | n/a | `set(string)` | `null` | no |
| <a name="input_grantee_principal"></a> [grantee\_principal](#input\_grantee\_principal) | n/a | `string` | n/a | yes |
| <a name="input_key_id"></a> [key\_id](#input\_key\_id) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `null` | no |
| <a name="input_operations"></a> [operations](#input\_operations) | n/a | `set(string)` | n/a | yes |
| <a name="input_retire_on_delete"></a> [retire\_on\_delete](#input\_retire\_on\_delete) | n/a | `bool` | `null` | no |
| <a name="input_retiring_principal"></a> [retiring\_principal](#input\_retiring\_principal) | n/a | `string` | `null` | no |


## Outputs

No outputs.

### Usage

Example for `main.tf` file:

```terraform
#TODO:
```
