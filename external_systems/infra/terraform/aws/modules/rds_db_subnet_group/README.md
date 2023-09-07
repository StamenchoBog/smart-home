# RDS DB subnet group module

The RDS DB subnet group module creates RDS database subnet group from the given variables.

## Module logic and accepted variables

The module accepts couple of variables and creates RDS database subnet group depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards.

### Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the db subnet group. |
| <a name="output_id"></a> [id](#output\_id) | The db subnet group name. |

## Usage

Example usage for `main.tf` file:

```terraform
module "db_subnet_group" {
  environment = "production"
  source  = "../../modules/rds_db_subnet_group"
  name    = var.rds.subnet_group.name
  # Private VPC subnets created for provisioning databases
  subnet_ids = slice(module.vpc.private_subnets_id, 3, 6)
  tags       = var.rds.tags
}
```
