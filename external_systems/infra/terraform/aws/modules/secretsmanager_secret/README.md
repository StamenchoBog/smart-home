# Secrets Manager secret module

The module `secretsmanager_secret` creates a secret in Secrets Manager with the provided variables.

## Module logic and accepted variables

The module accepts couple of variables and creates `aws_secretsmanager_secret` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory. 

### Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name                                                                                                                               | Description | Type | Default | Required |
|------------------------------------------------------------------------------------------------------------------------------------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment)                                                                | n/a | `string` | n/a     |   yes    |
| <a name="input_description"></a> [description](#input\_description)                                                                | n/a | `string` | `null`  |    no    |
| <a name="input_force_overwrite_replica_secret"></a> [force\_overwrite\_replica\_secret](#input\_force\_overwrite\_replica\_secret) | n/a | `bool` | `null`  |    no    |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id)                                                               | n/a | `string` | `null`  |    no    |
| <a name="input_name"></a> [name](#input\_name)                                                                                     | n/a | `string` | n/a     |   yes    |
| <a name="input_policy"></a> [policy](#input\_policy)                                                                               | n/a | `string` | `null`  |    no    |
| <a name="input_recovery_window_in_days"></a> [recovery\_window\_in\_days](#input\_recovery\_window\_in\_days)                      | n/a | `number` | `null`  |    no    |
| <a name="input_replica"></a> [replica](#input\_replica)                                                                            | n/a | <pre>object({<br>    kms_key_id = optional(string)<br>    region = string<br>  })</pre> | `null`  |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                                                                                     | n/a | `map(string)` | `null`  |   yes    |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the secret. |
| <a name="output_id"></a> [id](#output\_id) | ID of the secret. |

## Usage

Example for `main.tf` file:

```terraform
module "db_secret" {
  source = "../../modules/secretsmanager_secret"
  name   = "db_secret"
}
```
