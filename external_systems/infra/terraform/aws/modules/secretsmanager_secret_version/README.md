# Secrets Manager secret version module

The module `secretsmanager_secret_version` creates a version of a secret in Secrets Manager with the provided variables.

## Module logic and accepted variables

The module accepts couple of variables and creates `aws_secretsmanager_secret_version` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory. 

### Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret_version.secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_secret_binary"></a> [secret\_binary](#input\_secret\_binary) | n/a | `string` | `null` | no |
| <a name="input_secret_id"></a> [secret\_id](#input\_secret\_id) | n/a | `string` | n/a | yes |
| <a name="input_secret_string"></a> [secret\_string](#input\_secret\_string) | n/a | `string` | `null` | no |
| <a name="input_version_stages"></a> [version\_stages](#input\_version\_stages) | n/a | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | A pipe delimited combination of secret ID and version ID. |
| <a name="output_version_id"></a> [version\_id](#output\_version\_id) | The unique identifier of the version of the secret. |

## Usage

Example for `main.tf` file:

```terraform
module "db_secret_version" {
  source    = "../../modules/secretsmanager_secret_version"
  secret_id = module.db_secret.id
  secret_string = jsonencode({
    master_username = var.master_username
    master_password = random_password.generated_password1.result
    admin_username  = var.admin_username
    admin_password  = random_password.generated_password2.result
    engine          = var.rds.engine
    host            = module.db_instance.address
    port            = module.db_instance.port
  })
}
```
